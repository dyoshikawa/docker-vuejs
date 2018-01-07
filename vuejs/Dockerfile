FROM node:alpine

# install bash nginx
RUN apk --update add bash nginx

# setup nginx
RUN sed -i 's/user\ \ nginx\;/user\ \ 1000\;/g' /etc/nginx/nginx.conf \
 && mkdir /run/nginx
ADD server.conf /etc/nginx/conf.d/default.conf

# set pre_workdir
RUN mkdir -p /var/www/vuejs_pre
WORKDIR /var/www/vuejs_pre

# make directories
RUN mkdir -p src/js \
 && mkdir src/js/components \
 && mkdir src/scss \
 && mkdir dist

# add files
ADD package.json package.json
ADD .babelrc .babelrc
ADD webpack.config.js webpack.config.js
ADD index.html index.html
ADD app.js src/js/app.js
ADD style.scss src/scss/style.scss

# install node-modules
RUN npm install --save-dev webpack babel-cli babel-preset-env babel-loader \
      vue-template-compiler vue-loader node-sass \
 && npm install --save vue bootstrap-sass \

# build js and sass
RUN npm run build

# set workdir
RUN mkdir /var/www/vuejs
WORKDIR /var/www/vuejs

# setup entrypoint
ADD vuejs-entrypoint.sh /bin/vuejs-entrypoint.sh
RUN chmod 777 /bin/vuejs-entrypoint.sh
ENTRYPOINT ["sh", "/bin/vuejs-entrypoint.sh"]