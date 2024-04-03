FROM alpine:latest
LABEL DESCRIPTION "Déploiement moodle de CMC by christophe.merle@gmail.com"
RUN apk add apache2 php-fpm
WORKDIR /var/www/moodle
ADD https://download.moodle.org/download.php/direct/stable403/moodle-4.3.3.tgz .
RUN tar -xzf moodle-4.3.3.tgz
COPY httpd.sh /usr/sbin/
RUN chmod +x /usr/sbin/httpd.sh
ENTRYPOINT  /usr/sbin/httpd.sh
