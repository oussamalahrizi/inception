FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y vsftpd

RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/init.sh /bin/init.sh

RUN chmod +x /bin/init.sh

ENTRYPOINT ["/bin/init.sh"]