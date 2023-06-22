#!/usr/bin/env bash

echo "[STARTED]   $(date)"

# Database connection parameters
db_user="user"
db_password="password"
db_port="5432"

# Retry parameters
max_retries=2
retry_wait=2  # seconds

# Timeout parameters (cancel query after n seconds)
sql_timeout_seconds=20

# Heartbeat parameters
heartbeat_seconds=10

# Accept the environment as an argument to the script
environment=$1
# Accept the SQL file as an argument to the script
sql_file=$2
# Accept the log output directory as an argument to the script
log_directory=$3

# Verify that all arguments were provided
if [[ -z $environment || -z $sql_file || -z $log_directory ]]; then
  echo "Usage: $0 <environment> <SQL file> <log output directory>"
  exit 1
fi

# The shard databases
declare -A shards
case $environment in
  LOCAL)
    shards=(["localhost"]="shard1 shard2")
    ;;
  DEV)
    shards=(["host1d.example.com"]="shard1 shard2")
    ;;
  QA)
    shards=(["host1q.example.com"]="shard1 shard2")
    ;;
  UAT1)
    shards=(["host1u.example.com"]="shard1 shard2")
    ;;
  UAT2)
    shards=(["host2u.example.com"]="shard1 shard2")
    ;;
  UAT3)
    shards=(["host3u.example.com"]="shard1 shard2")
    ;;
  UAT_ALL)
    shards=(
      ["host1u.example.com"]="shard1 shard2"
      ["host2u.example.com"]="shard1 shard2"
      ["host3u.example.com"]="shard1 shard2"
    )
    ;;
  PAT)
    shards=(
      ["host1"]="shard1"
      ["host2"]="shard2"
      ["host3"]="shard3"
      ["host4"]="shard4"
      ["host5"]="shard5"
      ["host6"]="shard6"
      ["host7"]="shard7"
      ["host8"]="shard8"
      ["host9"]="shard9"
      ["host10"]="shard10"
    )
    ;;
  PROD)
    shards=(
      ["host1"]="shard1"
      ["host2"]="shard2"
      ["host3"]="shard3"
      ["host4"]="shard4"
      ["host5"]="shard5"
      ["host6"]="shard6"
      ["host7"]="shard7"
      ["host8"]="shard8"
      ["host9"]="shard9"
      ["host10"]="shard10"
    )
    ;;
  *)
    echo "Invalid environment: $environment"
    echo "Please provide one of: LOCAL, DEV, QA, UAT1, UAT2, UAT3, PAT, PROD"
    exit 1
esac

# Aggregated results from all databases (,, is like .toLower())
combined_log_file="${log_directory}${environment,,}_combined_log.txt"

# Extract the last SQL statement from the console sql file
query=$(tac $sql_file | awk '/---/{exit}1' | tac)
# `tac` reverses the order of lines in the file.
# `awk` reads the reversed lines, and exits when it encounters a line with '---'. Since the file is reversed, this will be the start of the last SQL statement.
# The second `tac` reverses the lines back to their original order. So the result is that `query` contains the last SQL statement from the file.

heartbeat() {
  while true; do
    echo "[HEARTBEAT] $(date)"
    sleep $heartbeat_seconds
  done
}

# Start the heartbeat in the background
heartbeat &

# Save the heartbeat process ID
heartbeat_pid=$!

# Handle SIGINT
trap 'cleanup_logs; kill $heartbeat_pid; exit' SIGINT

cleanup_logs() {
  for host in "${!shards[@]}"; do
    IFS=' ' read -r -a host_shards <<< "${shards[$host]}"

    for shard in "${host_shards[@]}"; do
      log_file="${host//./_}_${shard}_log.txt"

      [[ -e $log_file ]] && rm $log_file
    done
  done
}

run_query() {
  local host=$1
  local shard=$2
  local retries=0
  local log_file="${host//./_}_${shard}_log.txt"
  local timeout_secs=$sql_timeout_seconds

  # Start of the shard output
  echo "-- ${shard} (${host})" >> $log_file

  while ((retries < max_retries)); do
    timeout $timeout_secs bash -c "echo \"$query\" | PGPASSWORD=$db_password psql --no-psqlrc -U $db_user -h $host -p $db_port -d $shard -t" >> $log_file 2>&1
    command_status=$?

    case $command_status in
      0)
        return 0
        ;;
      124)
        echo "-- [ERROR] Query $shard on $host timed out after $timeout_secs seconds, retrying in $retry_wait seconds..." >> $log_file
        ;;
      *)
        echo "-- [ERROR] Failed to query $shard on $host, retrying in $retry_wait seconds..." >> $log_file
    esac

    ((retries++))

    sleep $retry_wait
  done

  echo "-- [ERROR] Failed to query $shard on $host after $max_retries attempts." >> $log_file

  return 1
}

combine_logs() {
  for host in "${!shards[@]}"; do
    IFS=' ' read -r -a host_shards <<< "${shards[$host]}"

    for shard in "${host_shards[@]}"; do
      log_file="${host//./_}_${shard}_log.txt"

      [[ -e $log_file ]] && cat $log_file >> $combined_log_file
    done
  done
}

log_run() {
  echo "==== START OF RUN: $(date) ====" >> $combined_log_file

  # Start processes for each host and collect host PIDs
  host_pids=()
  for host in "${!shards[@]}"; do
    (
      # Run the query on each host's shards in parallel and collect shard PIDs
      shard_pids=()
      IFS=' ' read -r -a host_shards <<< "${shards[$host]}"
      for shard in "${host_shards[@]}"; do
        run_query $host $shard &
        shard_pids+=($!)
      done

      # Wait for all background jobs to finish within this host
      for pid in "${shard_pids[@]}"; do
        wait $pid
      done
    ) &
    host_pids+=($!)
  done

  # Wait for all background jobs to finish across hosts
  for pid in "${host_pids[@]}"; do
    wait $pid
  done

  combine_logs
  cleanup_logs

  echo "==== END OF RUN: $(date) ====" >> $combined_log_file
  echo -e "\n\n\n" >> $combined_log_file  # Append spacers between runs
}

log_run

# Finish script execution
kill $heartbeat_pid
echo "[FINISHED]  $(date)"
