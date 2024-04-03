#!/bin/sh
set -e
rm -f /etc/httpd/run/httpd.pid
/usr/sbin/php-fpm82
/usr/sbin/httpd -DFOREGROUND
