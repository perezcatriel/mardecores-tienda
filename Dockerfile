# Usar la imagen oficial de WordPress
FROM wordpress:latest

# Copiar el archivo de configuración personalizado (si es necesario)
# COPY wp-config.php /var/www/html/

# Exponer el puerto 80
EXPOSE 80
