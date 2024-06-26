ARG CODE_SERVER_VERSION=4.90.2

FROM linuxserver/code-server:${CODE_SERVER_VERSION}

ARG PHP_VERSION=8.3
ARG COMPOSER_VERSION=2.7.1

# Install PHP
RUN apt-get update  \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y \
        zip \
        php${PHP_VERSION} \
        php${PHP_VERSION}-zip \
        php${PHP_VERSION}-mysql \
        php${PHP_VERSION}-pgsql \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-common \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-common \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-readline \
        php${PHP_VERSION}-mcrypt \
        php${PHP_VERSION}-intl \
    && apt-get clean && apt-get autoclean

# Install composer
RUN curl -sS https://getcomposer.org/download/$COMPOSER_VERSION/composer.phar -o /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

# Install dev tools
RUN apt-get update && apt-get install -y vim \
    && apt-get clean && apt-get autoclean
