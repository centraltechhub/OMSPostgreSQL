#!/bin/sh   
./OMS/dockerimageclean.sh
./PostgreSQL/dockerimageclean.sh
docker network rm omspostgres
