#!/bin/sh
set -e
rm -f /etc/httpd/run/httpd.pid
/usr/bin/php
/usr/sbin/httpd -DFOREGROUND
