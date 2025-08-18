#!/bin/bash
set -e

# Stop the running container (if any)
containerid=$(docker ps | awk 'NR>1 {print $1}')

if [ -n "$containerid" ]; then
  echo "🛑 Stopping container(s): $containerid"
  docker stop $containerid

  echo "🧹 Removing container(s): $containerid"
  docker rm $containerid
else
  echo "✅ No running containers found."
fi
