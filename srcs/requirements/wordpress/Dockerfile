FROM debian:bullseye

RUN apt update -y && \
  apt install -y php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
  wget curl \
  mariadb-client


COPY ./tools/init.sh  /bin/init.sh
RUN chmod +x /bin/init.sh

RUN mkdir -p /run/php/

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
  tar -xzf latest.tar.gz && \
  mv wordpress/* . && \
  rm -rf wordpress

RUN mv wp-config-sample.php wp-config.php

# wp cli to create admin user and normal user for automated config

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["/bin/init.sh"]

CMD ["php-fpm7.4",  "-F"]








