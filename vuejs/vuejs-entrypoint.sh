#!/usr/bin/env bash
if [ -f /var/www/vuejs/index.html ]; then
    sudo rm -rf /var/www/vuejs-pre
    sudo npm install
    sudo npm run build
else
    sudo mv /var/www/vuejs-pre/* /var/www/vuejs/
    sudo mv /var/www/vuejs-pre/.??* /var/www/vuejs/
    sudo rmdir /var/www/vuejs-pre
fi
sudo chown -R 1000:1000 /var/www/vuejs
sudo nginx -g 'daemon off;'