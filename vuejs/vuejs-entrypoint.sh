#!/usr/bin/sh
if [ -f /var/www/vuejs/index.html ]; then
    sudo rm -rf /var/www/vuejs-pre
    sudo npm install
else
    mv /var/www/vuejs-pre/* /var/www/vuejs/
    mv /var/www/vuejs-pre/.??* /var/www/vuejs/
    rmdir /var/www/vuejs_pre
fi
chown -R 1000:1000 /var/www/vuejs
nginx -g 'daemon off;'