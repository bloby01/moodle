FROM alpine:latest
LABEL DESCRIPTION "Déploiement moodle de CMC by christophe.merle@gmail.com"
RUN apk add apache2 php-fpm
RUN mkdir /var/moodledata && chown -R apache:apache /var/moodledata && chmod 0770 /var/moodledata
ADD https://download.moodle.org/download.php/direct/stable403/moodle-4.3.3.tgz .
RUN tar -C /var/www/moodle -xzf moodle-4.3.3.tgz &&  chown -R apache:apache /var/www/moodle && chmod 0550 /var/www/moodle
COPY 
COPY httpd.sh /usr/sbin/
RUN chmod +x /usr/sbin/httpd.sh
ENTRYPOINT  /usr/sbin/httpd.sh
