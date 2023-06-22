#!/usr/bin/env zsh

# https://unix.stackexchange.com/a/145188

key_name=ryan.fergerson@test.com.pub

servers=(
# DEV
'host1'
# QA
'host2'
)

for server in "${SERVERS[@]}"; do
  echo "Copying ssh key to $server"
  ssh-copy-id -i ~/.ssh/$KEY_NAME $server
done
