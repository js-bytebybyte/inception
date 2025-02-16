#!/bin/bash

# Start MySQL in the background
mysqld_safe --skip-networking &
sleep 5  # Give MySQL time to start

# Wait until MySQL is actually ready
until mysqladmin ping -uroot -p"${MARIADB_ROOT_PASSWORD}" --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

# Check if the database exists before proceeding
if ! mysql -uroot -p"${MARIADB_ROOT_PASSWORD}" -e "USE ${MARIADB_DATABASE}" 2>/dev/null; then
    echo "Creating database ${MARIADB_DATABASE}..."
    mysql -uroot -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
    mysql -uroot -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mysql -uroot -p"${MARIADB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%';"
    mysql -uroot -p"${MARIADB_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    mysql -uroot -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
fi

# Stop MySQL gracefully
mysqladmin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown

# Start MariaDB in the foreground
exec mysqld_safe
