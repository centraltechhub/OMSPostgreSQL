docker build ./OMS/ -t centraltechhub/omsplsql:v1
docker run -idt -p 9080:9080 --name omsplsql centraltechhub/omsplsql:v1