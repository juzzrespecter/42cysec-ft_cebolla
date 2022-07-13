#!/bin/bash

if [ "$1" == "exec" ]; then
    if [ -z "$2" ] || [ -z "$(docker ps | grep cebolla)" ]; then
        echo "[ FATAL ERROR ] cebolla container not running" 1>&2
        exit 1
    fi
    docker exec -it cebolla $2
    exit 0
fi

docker build . -t cebolla:latest
docker run \
        --name cebolla \
        --rm \
        cebolla:latest