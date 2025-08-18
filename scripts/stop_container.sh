#!/bin/bash

# Find container ID (running OR stopped) using port 5000
cid=$(docker ps -a | grep "5000" | awk '{print $1}')

if [ -n "$cid" ]; then
  echo "Stopping and removing container(s) on port 5000"
  docker stop $cid 2>/dev/null
  docker rm $cid
else
  echo "No container found on port 5000"
fi

# Also free up port 5000 if something else is using it
pid=$(lsof -ti:5000)
if [ -n "$pid" ]; then
  echo "Killing process using port 5000 (PID: $pid)"
  kill -9 $pid
fi
