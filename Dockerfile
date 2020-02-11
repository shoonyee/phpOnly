FROM php:7.3-apache
COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html a2enmod rewrite   
ENTRYPOINT ["tail", "-f", "/dev/null"]
