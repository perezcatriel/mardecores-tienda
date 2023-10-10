# Usamos la imagen oficial de WordPress
FROM wordpress:latest

# Instalamos el plugin de WooCommerce
RUN apt-get update \
    && apt-get install -y wget unzip \
    && wget https://wordpress.org/plugins/woocommerce/latest.zip \
    && unzip latest.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm latest.zip \
    && apt-get remove --purge -y wget unzip \
    && apt-get autoremove -y
