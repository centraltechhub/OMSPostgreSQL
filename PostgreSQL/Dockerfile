FROM ubuntu
RUN apt-get update
RUN apt-get -y install zip
RUN apt-get -y install passwd
RUN apt-get -y install telnet
RUN apt-get -y install vim
RUN apt-get -y install default-jdk
RUN { echo "password"; echo "password"; } | passwd root
RUN useradd postgres
RUN { echo "password"; echo "password"; } | passwd postgres
ARG DEBIAN_FRONTEND=noninteractive
RUN  apt-get -y install  postgresql
RUN mkdir /home/postgres
COPY postgres-start.sh /home/postgres
RUN chown -R postgres:postgres /home/postgres
RUN chmod 777 home/postgres/postgres-start.sh
RUN su - postgres -c '/usr/lib/postgresql/14/bin/initdb -D /home/postgres/data -U postgres'
RUN echo 'host            all     all             all                     trust' >> /home/postgres/data/pg_hba.conf
RUN echo "listen_addresses='*'" >> /home/postgres/data/postgresql.conf
EXPOSE 5432   
USER postgres
CMD home/postgres/postgres-start.sh