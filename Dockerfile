FROM php:7.3-apache
COPY . /var/www/html/

RUN chmod -R o+rw bootstrap/ storage/
RUN chown -R www-data:www-data /var/www/html 
RUN a2enmod rewrite   
ENTRYPOINT ["tail", "-f", "/dev/null"]
