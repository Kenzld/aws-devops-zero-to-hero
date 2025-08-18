#!/bin/bash

# Find container ID running on port 5000
cid=$(docker ps | grep "5000" | awk '{print $1}')

# If container exists, stop it
if [ -n "$cid" ]; then
  echo "Stopping container $cid"
  docker stop $cid
  docker rm $cid
else
  echo "No container found on port 5000"
fi
