FROM php:5.5-apache

# Basic PHP module dependencies
RUN apt-get update && apt-get install -y \
        libc-client-dev \
        libkrb5-dev \
        zlib1g-dev \
        libmcrypt-dev \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install \
        imap \
        mbstring \
        mcrypt \
        mysql \
        mysqli \
        pdo \
        pdo_mysql \
        zip

# Install Node
RUN apt-get install -y curl \
    && curl --silent --location https://deb.nodesource.com/setup_4.x | bash - \
    && apt-get install -y nodejs
