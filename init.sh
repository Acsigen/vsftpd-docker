#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Please provide user and password as arguments"
else
    docker compose build --build-arg PROFTPD_USER="$1" --build-arg PROFTPD_PASSWORD="$2"
    echo "PROFTPD_USER=$1" > ./.env
fi