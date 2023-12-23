#!/bin/sh
# Create Docker group and add Jenkins user to it
addgroup -g $DOCKER_GID dockergroup
addgroup jenkins dockergroup
