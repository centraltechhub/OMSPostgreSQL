#!/bin/sh
/usr/lib/postgresql/14/bin/postgres -D /home/postgres/data >/home/postgres/dbstart.log 2>&1 &
createdb $DB_NAME > /home/postgres/dbcreate.log
psql -h localhost -p 5432 -U postgres OMS -c "CREATE SCHEMA IF NOT EXISTS postgres AUTHORIZATION postgres;"
tail -f /home/postgres/dbstart.log