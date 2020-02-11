FROM php:7.3-apache
RUN a2enmod lbmethod_byrequests
COPY . /var/www/html/
EXPOSE 8000
