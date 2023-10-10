FROM wordpress:latest

# Instalar el plugin WPPG
RUN apt-get update && apt-get install -y wget unzip \
    && wget [URL_DEL_PLUGIN_WPPG] -O wppg.zip \
    && unzip wppg.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm wppg.zip \
    && apt-get remove --purge -y wget unzip \
    && apt-get autoremove -y

# Exponer el puerto 80
EXPOSE 80
