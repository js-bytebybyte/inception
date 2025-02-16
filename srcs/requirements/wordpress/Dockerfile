# Use the official PHP-FPM image as the base
FROM php:8.3-fpm

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    mariadb-client \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql mysqli zip

# install vim
RUN apt install vim -y

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www 
    # && tar -xzf /var/www/latest.tar.gz -C /var/www \
    # && rm /var/www/latest.tar.gz \
    # && chown -R www-data:www-data /var/www/wordpress

# decompress the tar file
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

# check/provide root access to write in created folder
RUN chown -R root:root /var/www/wordpress

# Copy custom www.conf file into the container
COPY www.conf /etc/php/8.3/fpm/pool.d/www.conf

# Install WP-CLI for WordPress management
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp


# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the working directory
WORKDIR /var/www/wordpress

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Start PHP-FPM
CMD ["php-fpm"]
