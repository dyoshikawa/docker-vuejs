FROM node:alpine

RUN apk --update add nginx \
 && sed -i 's/user\ \ nginx\;/user\ \ 1000\;/g' /etc/nginx/nginx.conf \
 && mkdir /run/nginx
ADD server.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/vuejs_pre
WORKDIR /var/www/vuejs_pre

RUN mkdir -p src/js \
 && mkdir src/js/components \
 && mkdir src/scss \
 && mkdir dist

ADD package.json package.json
ADD .babelrc /var/www/vuejs_pre/.babelrc
ADD webpack.config.js /var/www/vuejs_pre/webpack.config.js
ADD index.html index.html
ADD app.js src/js/app.js
ADD style.scss src/scss/style.scss

RUN npm install --save-dev webpack babel-cli babel-preset-env babel-loader \
      vue-template-compiler vue-loader \
      node-sass extract-text-webpack-plugin css-loader sass-loader \
 && npm install --save vue bootstrap-sass

RUN mkdir /var/www/vuejs
WORKDIR /var/www/vuejs

ADD vuejs-entrypoint.sh /bin/vuejs-entrypoint.sh
RUN chmod 777 /bin/vuejs-entrypoint.sh
ENTRYPOINT ["sh", "/bin/vuejs-entrypoint.sh"]