FROM alpine:3.6
MAINTAINER Anastas Dancha <anapsix@random.io>
RUN apk -U upgrade && \
    apk add php7-pgsql php7-xml php7-memcached php7-json php7-apcu php7-openssl php7-mbstring php7-curl php7-ctype php7-iconv php7-fpm caddy && \
    apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv && \
    sed -i '/clear_env/s/^;//g' /etc/php7/php-fpm.d/www.conf
COPY Caddyfile /
ONBUILD COPY . /srv/app/
ENV APP_ROOT /srv/app
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php
WORKDIR /
EXPOSE 80
CMD ( [ -e ${APP_ROOT}/app/views/cache ] && \
      chmod 777 -R ${APP_ROOT}/app/views/cache/ ) && \
    php-fpm7 -D && \
    caddy -root ${APP_ROOT}/public