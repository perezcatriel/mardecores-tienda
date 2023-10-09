FROM wordpress:latest

# Instalar WooCommerce y el tema Storefront
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip && \
    unzip woocommerce.latest-stable.zip -d /usr/src/wordpress/wp-content/plugins/ && \
    wget https://downloads.wordpress.org/theme/storefront.latest-stable.zip && \
    unzip storefront.latest-stable.zip -d /usr/src/wordpress/wp-content/themes/ && \
    rm *.zip && \
    apt-get purge -y wget unzip && apt-get autoremove -y && apt-get clean

# Asegúrate de que WordPress sepa que queremos usar estos
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins/woocommerce
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/themes/storefront
