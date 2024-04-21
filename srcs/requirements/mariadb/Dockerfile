FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init.sh /bin/init.sh

RUN chmod +x /bin/init.sh

ENTRYPOINT ["sh", "/bin/init.sh"]
