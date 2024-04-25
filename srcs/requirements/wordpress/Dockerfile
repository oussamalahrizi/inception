FROM debian:bullseye

RUN apt update -y && \
  apt install -y php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
  mariadb-client curl wget && \
  rm -rf /var/lib/apt/lists/*


COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/init.sh  /bin/init.sh
RUN chmod +x /bin/init.sh

RUN mkdir -p /run/php/

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget https://wordpress.org/wordpress-6.5.2.tar.gz && \
  tar -xzf wordpress-6.5.2.tar.gz && \
  mv wordpress/* . && \
  rm -rf wordpress wordpress-6.5.2.tar.gz

RUN mv wp-config-sample.php wp-config.php


# wp cli to create admin user and normal user for automated config

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["/bin/init.sh"]

CMD ["php-fpm7.4",  "-F"]








