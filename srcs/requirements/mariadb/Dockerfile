FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get install -y vim curl

# Download the mariadb repo
RUN curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup
RUN apt install -y mariadb-server mariadb-client

# Copy MariaDB configuration file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql restart

# Copy the initialization script into the container
COPY init_mariadb.sh /usr/local/bin/init_mariadb.sh

# Ensure the script is executable
RUN chmod +x /usr/local/bin/init_mariadb.sh

# Expose the default MariaDB port
EXPOSE 3306

# Set the entrypoint to execute the initialization script
ENTRYPOINT ["/usr/local/bin/init_mariadb.sh"]