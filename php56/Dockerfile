FROM php:5.6-fpm

MAINTAINER MComScience <m-com3@hotmail.com>

RUN apt-get update && apt-get install -y freetds-bin freetds-dev freetds-common libct4 libsybdb5 libicu-dev libcurl3-dev git zlib1g-dev apt-transport-https gnupg wget autoconf tzdata openntpd file g++ git gcc binutils libc-dev musl-dev make re2c libstdc++ coreutils libmcrypt-dev libpng-dev libxml2-dev libcurl4-openssl-dev curl \
    libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
    libssl-dev \
    zip

RUN docker-php-ext-configure intl --enable-intl \
    && docker-php-ext-install -j$(nproc) iconv mysqli pdo pdo_mysql curl bcmath mbstring json xml zip opcache intl \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd

# TimeZone
RUN cp /usr/share/zoneinfo/Asia/Bangkok /etc/localtime \
&& echo "Asia/Bangkok" >  /etc/timezone

# Install Composer && Assets Plugin
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer global require --no-progress "fxp/composer-asset-plugin:~1.4" \
#&& apk del tzdata \
&& rm -rf /var/cache/apk/*

EXPOSE 9000
EXPOSE 22

CMD ["php-fpm"]

