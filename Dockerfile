FROM php:7.1.8-apache

MAINTAINER Shajal Ahamed

COPY . /srv/app
COPY .vh/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN chown -R www-data:www-data /srv/app \
    && a2enmod rewrite
