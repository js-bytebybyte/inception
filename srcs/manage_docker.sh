#!/bin/bash

# Check if a container name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <container_name>"
  exit 1
fi

CONTAINER_NAME="$1"

# Stop the container
docker stop "$CONTAINER_NAME"
if [ $? -eq 0 ]; then
  echo "Container $CONTAINER_NAME stopped successfully."
else
  echo "Failed to stop container $CONTAINER_NAME."
  exit 1
fi

# Remove the container
docker rm "$CONTAINER_NAME"
if [ $? -eq 0 ]; then
  echo "Container $CONTAINER_NAME removed successfully."
else
  echo "Failed to remove container $CONTAINER_NAME."
  exit 1
fi

# List all containers
docker ps -a
