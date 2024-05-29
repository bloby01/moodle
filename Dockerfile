FROM alpine:latest
LABEL DESCRIPTION "Déploiement moodle de CMC by christophe.merle@gmail.com"
RUN apk add apache2 php
RUN mkdir /var/moodledata && chown -R apache:apache /var/moodledata && chmod 0770 /var/moodledata
ADD https://download.moodle.org/download.php/direct/stable403/moodle-4.3.3.tgz .
RUN tar -xzf moodle-4.3.3.tgz -C /var/www/
RUN chown -R apache:apache /var/www/moodle && chmod 0550 /var/www/moodle
COPY moodle.conf  /etc/apache2/conf.d/
COPY DBmysql /var/moodledata
COPY config.php /var/www/moodle/config.php
RUN chown apache:apache /var/www/moodle/config.php && chmod 0440 /var/www/moodle/config.php
RUN chown apache:apache /var/moodledata/DBmysql && chmod 0400 /var/moodledata/DBmysql
COPY httpd.sh /usr/sbin/
RUN chmod +x /usr/sbin/httpd.sh
ENTRYPOINT  /usr/sbin/httpd.sh
