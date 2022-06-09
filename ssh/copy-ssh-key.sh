#!/bin/bash

# https://unix.stackexchange.com/a/145188

KEY_NAME=ryan.fergerson@test.com.pub

SERVERS=(
# DEV
'host1'
# QA
'host2'
)

for server in "${SERVERS[@]}"; do
  echo "Copying ssh key to $server"
  ssh-copy-id -i ~/.ssh/$KEY_NAME $server
done
