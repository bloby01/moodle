FROM alpine:latest
RUN apk add apache php
WORKDIR /var/www/moodle
ADD https://download.moodle.org/download.php/stable403/moodle-latest-403.tgz .
RUN tar -x moodle-latest-403.tgz
COPY httpd.sh /usr/sbin/
RUN chmod +x /usr/sbin/httpd.sh
ENTRYPOINT  /usr/sbin/httpd.sh
