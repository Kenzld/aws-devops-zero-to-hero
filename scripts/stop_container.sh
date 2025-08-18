#!/bin/bash
set -e

# Stop any container already running on port 5000
old_container=$(docker ps -q )

if [ -n "$old_container" ]; then
  echo "🛑 Stopping old container : $old_container"
  docker stop $old_container
  docker rm $old_container
fi

# Pull the latest image
docker pull kenzieeiy/simple-python-flask-app:latest

# Run a fresh container
docker run -d -p 5000:5000 --name flask-app kenzieeiy/simple-python-flask-app:latest
