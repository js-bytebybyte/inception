#!/bin/bash

# making sure mariaDB has been launched before config WordPress db
sleep 10

# configuration WordPress database connection details
wp config create --allow-root \
	--dbname=$MARIADB_DATABASE \
	--dbuser=$MARIADB_USER \
	--dbpass=$MARIADB_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'
