FROM debian:buster

# Install MariaDB and necessary tools
RUN apt update -y && apt upgrade -y
RUN apt-get install -y mariadb-server vim curl

# Copy MariaDB configuration file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the initialization script into the container
COPY init_mariadb.sh /usr/local/bin/init_mariadb.sh

# Ensure the script is executable
RUN chmod +x /usr/local/bin/init_mariadb.sh

# Set env variables
#ENV MARIADB_DATABASE=wordpress
#ENV MARIADB_USER=jsteenpu
#ENV MARIADB_PASSWORD=19
#ENV MARIADB_ROOT_PASSWORD=42

# Expose the default MariaDB port
EXPOSE 3306

# Set the entrypoint to execute the initialization script
ENTRYPOINT ["/usr/local/bin/init_mariadb.sh"]

