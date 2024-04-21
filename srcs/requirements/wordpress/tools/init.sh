#!/bin/bash

WP_CONFIG="/var/www/html/wp-config.php"



sed -i "s/'database_name_here'/'$MYSQL_DATABASE'/g" "$WP_CONFIG"
sed -i "s/'username_here'/'$MYSQL_USER'/g" "$WP_CONFIG"
sed -i "s/'password_here'/'$MYSQL_PASSWORD'/g" "$WP_CONFIG"
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb:3306');/" "$WP_CONFIG"



bash