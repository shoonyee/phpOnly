FROM php:7.3-apache
COPY . /var/www/html/
ENV APACHE_DOCUMENT_ROOT /path/to/new/root

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
EXPOSE 8000
