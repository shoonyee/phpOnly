FROM php:7.3-apache
COPY . /var/www/html/
ENTRYPOINT ["tail", "-f", "/dev/null"]
