#!/bin/sh
# Check if a group with DOCKER_GID already exists
if getent group $DOCKER_GID; then
    # Group exists, get its name
    DOCKER_GROUP=$(getent group $DOCKER_GID | cut -d: -f1)
else
    # Group doesn't exist, create a new one named dockergroup
    DOCKER_GROUP=dockergroup
    addgroup -g $DOCKER_GID $DOCKER_GROUP
fi

# Add Jenkins user to the Docker group
addgroup jenkins $DOCKER_GROUP