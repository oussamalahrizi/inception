

echo "✔ Started server \n"

service mariadb start


sleep 2

mysql -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;"
mysql -e "CREATE USER IF NOT EXISTS \`$MYSQL_USER\`@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

echo "✔ shutdown\n";

mysqld_safe
