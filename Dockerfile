FROM wordpress:latest

# Instalar el plugin PG4WP
RUN apt-get update && apt-get install -y wget unzip \
    && wget https://github.com/kevinoid/postgresql-for-wordpress/archive/refs/heads/master.zip -O pg4wp.zip \
    && unzip pg4wp.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && mv /usr/src/wordpress/wp-content/plugins/postgresql-for-wordpress-master /usr/src/wordpress/wp-content/plugins/postgresql-for-wordpress \
    && rm pg4wp.zip \
    && apt-get remove --purge -y wget unzip \
    && apt-get autoremove -y

# Exponer el puerto 80
EXPOSE 80
