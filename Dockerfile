FROM alpine:latest
LABEL DESCRIPTION "Déploiement moodle de CMC by christophe.merle@gmail.com"
RUN apk add apache2 php8
WORKDIR /var/www/moodle
ADD https://download.moodle.org/download.php/stable403/moodle-latest-403.tgz .
RUN tar -x moodle-latest-403.tgz
COPY httpd.sh /usr/sbin/
RUN chmod +x /usr/sbin/httpd.sh
ENTRYPOINT  /usr/sbin/httpd.sh
