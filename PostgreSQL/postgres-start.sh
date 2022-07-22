#!/bin/sh
/usr/lib/postgresql/14/bin/postgres -D /home/postgres/data >/home/postgres/dbstart.log 2>&1 &
createdb $DB_NAME > /home/postgres/dbcreate.log
createuser "cn_stgchnmaster"
createuser "cn_stgchntrans"
createuser "cn_stgconfig"
createuser "cn_stgmetadata"
createuser "cn_stgstats"
psql -h localhost -p 5432 -U postgres $DB_NAME -c 'CREATE SCHEMA IF NOT EXISTS "cn_stgchnmaster" AUTHORIZATION "cn_stgchnmaster";'
psql -h localhost -p 5432 -U postgres $DB_NAME -c 'CREATE SCHEMA IF NOT EXISTS "cn_stgchntrans" AUTHORIZATION "cn_stgchntrans";'
psql -h localhost -p 5432 -U postgres $DB_NAME -c 'CREATE SCHEMA IF NOT EXISTS "cn_stgconfig" AUTHORIZATION "cn_stgconfig";'
psql -h localhost -p 5432 -U postgres $DB_NAME -c 'CREATE SCHEMA IF NOT EXISTS "cn_stgmetadata" AUTHORIZATION "cn_stgmetadata";'
psql -h localhost -p 5432 -U postgres $DB_NAME -c 'CREATE SCHEMA IF NOT EXISTS "cn_stgstats" AUTHORIZATION "cn_stgstats";'
tail -f /home/postgres/dbstart.log
