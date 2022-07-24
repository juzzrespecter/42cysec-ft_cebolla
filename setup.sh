#!/bin/bash

if [ "$1" == "cebolla" ]; then
    NGINX=$(docker exec tor-service sh -c "cat /var/lib/tor/ft_cebolla/hostname")
    SSH=$(docker exec tor-service sh -c "cat /var/lib/tor/sshd_cebolla/hostname")

    echo "Links cebolla:"
    echo "cebolla nginx: $NGINX"
    echo "cebolla ssh:   $SSH"
    exit 0
fi

if [[ $1 == "stop" ]]; then
    docker-compose down
    exit 0
fi

if [ "$1" == "exec" ]; then
    if [ -z "$2" ] || [ -z "$(docker ps | grep tor-service)" ]; then
        echo "[ FATAL ERROR ] cebolla container not running" 1>&2
        exit 1
    fi
    docker exec -it tor-service $2
    exit 0
fi

docker-compose up --build
