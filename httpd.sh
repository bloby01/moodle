#!/bin/sh
set -e
rm -f /etc/httpd/run/httpd.pid
/sbin/php-fpm82
/usr/sbin/httpd -DFOREGROUND
