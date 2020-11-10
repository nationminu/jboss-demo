#!/usr/bin/env bash

CONFIG_FILE=docker-compose.yaml

docker-compose -f ${CONFIG_FILE} up --build  --remove-orphans