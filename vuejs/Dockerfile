FROM node:alpine

# install bash nginx
RUN apk --update add bash nginx

# install sudo and set dockeruser sudoer
RUN apk add sudo \
 && echo 'node ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# setup nginx
RUN sed -i 's/user\ \ nginx\;/user\ \ 1000\;/g' /etc/nginx/nginx.conf \
 && mkdir /run/nginx
ADD server.conf /etc/nginx/conf.d/default.conf

# set pre-workdir
ADD vuejs-pre /var/www/vuejs-pre
WORKDIR /var/www/vuejs-pre

# install node-modules
RUN npm install \
 && npm run build

# set workdir
RUN mkdir /var/www/vuejs
WORKDIR /var/www/vuejs

# setup entrypoint
ADD vuejs-entrypoint.sh /vuejs-entrypoint.sh
RUN chmod 777 /vuejs-entrypoint.sh
USER node
ENTRYPOINT ["bash", "/vuejs-entrypoint.sh"]