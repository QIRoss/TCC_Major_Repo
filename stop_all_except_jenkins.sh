#!/bin/bash

# Get the ID of the container named "my_jenkins"
jenkins_id=$(docker ps -q -f name=my_jenkins)

# Stop all containers except "my_jenkins"
docker ps -q | while read -r container_id; do
    if [ "$container_id" != "$jenkins_id" ]; then
        docker stop "$container_id"
    fi
done
