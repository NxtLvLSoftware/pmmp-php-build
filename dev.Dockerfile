ARG PHP_VERSION
FROM docker.pkg.github.com/nxtlvlsoftware/pmmp-php-build/php:${PHP_VERSION}
MAINTAINER NxtLvl Software <contact@nxtlvlsoftware.net>

USER root

RUN apt-get update && apt-get install --no-install-recommends -y curl git

RUN mkdir /build
WORKDIR /build
RUN curl -L https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

RUN chmod o+x /usr/bin/composer

USER php
