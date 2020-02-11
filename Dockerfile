FROM php:7.3-apache
COPY . /var/www/html/

COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN chown -R www-data:www-data /var/www/html a2enmod rewrite   
ENTRYPOINT ["tail", "-f", "/dev/null"]
