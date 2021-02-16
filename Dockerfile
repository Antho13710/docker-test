FROM php:7.4-apache-buster

RUN docker-php-ext-install pdo_mysql
RUN pecl install apcu && docker-php-ext-enable apcu

ADD . /var/www/html
WORKDIR /var/www/html

VOLUME /var/www/html/logs

CMD a2enmod rewrite; service apache2 restart; php -S localhost:8000

