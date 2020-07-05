FROM ubuntu:18.04

RUN apt-get update && apt-get install --no-install-recommends -y curl ca-certificates build-essential m4 gzip bzip2 bison git cmake autoconf automake pkg-config libtool libtool-bin libicu-dev

RUN mkdir /build && mkdir /build/php
WORKDIR /build/php
ADD compile.sh /build/php/compile.sh
RUN ./compile.sh -t linux64 -j ${THREADS:-$(grep -E ^processor /proc/cpuinfo | wc -l)} -f -g
RUN ln -s /build/build/php/bin/php7/bin/php /usr/bin/php

WORKDIR /build
RUN curl -L https://getcomposer.org/installer | php
RUN mv composer.phar /usr/bin/composer

FROM ubuntu:18.04
MAINTAINER NxtLvl Software <contact@nxtlvlsoftware.net>

RUN apt-get update && apt-get install --no-install-recommends -y ca-certificates wget libicu-dev

RUN groupadd -g 1000 php
RUN useradd -r -d /php -p "" -u 1000 -m -g php php

COPY --from=0 /build/php/bin/php7 /usr/php
RUN ln -s /usr/php/bin/php /usr/bin/php

RUN chmod o+x /usr/bin/php

USER php

ENTRYPOINT ["php"]

CMD []