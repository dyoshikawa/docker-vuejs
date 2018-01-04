#!/usr/bin/sh
mv /var/www/vuejs_pre/* /var/www/vuejs/
mv /var/www/vuejs_pre/.??* /var/www/vuejs/
rmdir /var/www/vuejs_pre
chown -R 1000:1000 /var/www/vuejs
nginx -g 'daemon off;'