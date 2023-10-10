FROM wordpress:latest

# Instalar el plugin WPPG
RUN apt-get update && apt-get install -y wget unzip \
    && wget https://downloads.wordpress.org/plugin/wppg.1.0.1.zip -O wppg.zip \
    && unzip wppg.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm wppg.zip \
    && apt-get remove --purge -y wget unzip \
    && apt-get autoremove -y

# Exponer el puerto 80
EXPOSE 80
