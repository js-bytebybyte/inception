#!/bin/bash

# making sure mariaDB has been launched before config WordPress db
sleep 10

# Wait for MariaDB to be ready
# echo "Waiting for MariaDB to be ready..."
# while ! mysql -hmariadb -u$MARIADB_USER -p$MARIADB_PASSWORD $MARIADB_DATABASE &>/dev/null; do
#     sleep 1
# done

echo "MariaDB is ready!"

# Configure WordPress database connection
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Configuring WordPress..."
    wp config create --allow-root \
        --dbname=$MARIADB_DATABASE \
        --dbuser=$MARIADB_USER \
        --dbpass=$MARIADB_PASSWORD \
        --dbhost=mariadb:3306 \
        --path='/var/www/wordpress'
fi

# Start PHP-FPM
exec "$@"
