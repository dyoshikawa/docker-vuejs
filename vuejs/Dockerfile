FROM node:alpine

RUN apk --update add nginx \
 && sed -i 's/user\ \ nginx\;/user\ \ 1000\;/g' /etc/nginx/nginx.conf \
 && mkdir /run/nginx
ADD server.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/vuejs \
 && mkdir /var/www/vuejs_pre
WORKDIR /var/www/vuejs

RUN cd /var/www/vuejs_pre \
 && npm init -y \
 && npm install --save-dev webpack babel-core babel-loader babel-preset-env babel-preset-vue \
 && npm install --save vue bootstrap

ADD vuejs-entrypoint.sh /bin/vuejs-entrypoint.sh
RUN chmod 777 /bin/vuejs-entrypoint.sh

ENTRYPOINT ["sh", "/bin/vuejs-entrypoint.sh"]