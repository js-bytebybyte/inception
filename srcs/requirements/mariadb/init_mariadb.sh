#!/bin/bash

# Start the MyMARIADB service
service mysql start

# Create the database if it doesn't exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"

# Create a user and assign a password
mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

# Grant all privileges to the user for the database
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%';"

# Set the root password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

# Apply the changes
mysql -e "FLUSH PRIVILEGES;"

# Shut down MyMARIADB gracefully
mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown

# Start the MariaDB server in the foreground
exec mysqld_safe