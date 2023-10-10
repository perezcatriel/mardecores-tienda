FROM wordpress:latest

RUN apt-get update
RUN apt-get install -y wget unzip
RUN wget https://wordpress.org/plugins/woocommerce/latest.zip
RUN unzip latest.zip -d /usr/src/wordpress/wp-content/plugins/
RUN rm latest.zip
RUN apt-get remove --purge -y wget unzip
RUN apt-get autoremove -y
