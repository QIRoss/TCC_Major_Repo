#!/bin/bash

jenkins_id=$(docker ps -q -f name=my_jenkins)

docker ps -q | while read -r container_id; do
    if [ "$container_id" != "$jenkins_id" ]; then
        docker stop "$container_id"
    fi
done
