FROM debian:buster
RUN apt update && apt install -y
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y

# SSL settings 
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj /C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login
RUN mkdir -p /var/run/nginx

# Remove default configuration files
# RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom config files to Nginx Contatiner
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Change access to html files --> wordpress???
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
