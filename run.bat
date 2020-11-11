@echo off

rem # "set CONFIG_FILE=docker-compose.yaml"
set "CONFIG_FILE=docker-compose-wildfly.yaml"

docker-compose.exe -f %CONFIG_FILE% up --build  --remove-orphans