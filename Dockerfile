FROM php:7.3-apache
COPY . /var/www/html/

#RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
#RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
#EXPOSE 8000
# OpenShift Origin runs containers using an arbitrarily assigned user ID
# (random UID) and root group. The user ID of the container is generated
# dynamically, it will not have an associated entry in /etc/passwd.
# https://docs.openshift.org/latest/creating_images/guidelines.html
# Thus, in order to drop the root user, we have to:
# 1. Run apache2 on a custom port (8080), a non-root user does not have access to port 80.
# 2. Make some directories world writeable.
# https://askubuntu.com/a/338239
# https://github.com/openshift/origin/issues/6629
RUN sed -i "s/Listen 80/Listen 8000/g" /etc/apache2/ports.conf &&\
  sed -i "s/<VirtualHost \*:80>/<VirtualHost \*:8000>/g" /etc/apache2/sites-enabled/000-default.conf
#RUN mkdir -p /var/run/apache2 && chmod 777 -R /var/run/apache2 &&\
 # mkdir -p /var/log/apache2 && chmod 777 -R /var/log/apache2 &&\
 # mkdir -p /var/lock/apache2 && chmod 777 -R /var/lock/apache2 &&\
 # mkdir -p /etc/apache2/sites-enabled && chmod 777 -R /etc/apache2/sites-enabled &&\
 # mkdir -p /var/www/html && chmod 777 -R /var/www/html
