FROM wordpress:latest

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y wget unzip

# Descargar e instalar WooCommerce y el tema Storefront
RUN wget https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip && \
    unzip woocommerce.latest-stable.zip -d /usr/src/wordpress/wp-content/plugins/ && \
    wget https://downloads.wordpress.org/theme/storefront.latest-stable.zip && \
    unzip storefront.latest-stable.zip -d /usr/src/wordpress/wp-content/themes/ && \
    rm *.zip

# Limpiar
RUN apt-get purge -y wget unzip && apt-get autoremove -y && apt-get clean

# Cambiar permisos
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins/woocommerce
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/themes/storefront