FROM php:8.3-apache

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libopencv-dev && \
    docker-php-ext-install gd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY ./build/ /var/www/html/
COPY ../compile-all.sh /tmp

# Make compile script executable and run it
RUN chmod +x /tmp/compile-all.sh && /tmp/compile-all.sh

# Enable Apache modules and configurations
RUN echo "<VirtualHost *:80>\n\
    DocumentRoot /var/www/html\n\
    <Directory /var/www/html>\n\
        Options Indexes FollowSymLinks\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>\n\
    # Redirect from root to Introduction.html\n\
    RewriteEngine On\n\
    RewriteCond %{REQUEST_URI} ^/$\n\
    RewriteRule ^/$ /Introduction.html [R=301,L]\n\
    </VirtualHost>" > /etc/apache2/sites-available/000-default.conf && \
    a2enmod rewrite

# Set up PHP configuration
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# Set permissions for the web root
RUN chown -R www-data:www-data /var/www/html/ && chmod -R 755 /var/www/html/

# Expose port 80 and start Apache
EXPOSE 80
CMD ["apache2-foreground"]
