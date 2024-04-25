#!/bin/bash


mkdir -p /var/www/html


adduser  --disabled-password --gecos "" "$FTP_USER"
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USER:$FTP_USER /var/www/html

echo "$FTP_USER" > /etc/vsftpd.userlist

vsftpd /etc/vsftpd.conf