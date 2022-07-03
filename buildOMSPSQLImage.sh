#!/bin/sh   
./OMS/dockerimagebuild.sh
./PostgreSQL/dockerimagebuild.sh
docker network create omspostgres
docker network connect omspostgres omsplsql
docker network connect omspostgres postgres