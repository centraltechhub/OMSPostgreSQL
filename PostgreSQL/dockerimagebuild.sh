docker build ./PostgreSQL/ -t centraltechhub/postgresql:v1
docker run --env DB_NAME=OMSNPR -idt -p 5432:5432 --name postgres centraltechhub/postgresql:v1
