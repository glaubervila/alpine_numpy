FROM alpine:3.4

MAINTAINER Glauber Costa Vila Verde <glauber.vila.verde@gmail.com>

RUN apk add --no-cache \
        libpng \
        freetype \
        libstdc++ \
        python \
        py-pip

RUN apk add --no-cache --virtual .build-deps \
	    gcc \
	    build-base \
	    python-dev \
	    libpng-dev \
	    musl-dev \
	    freetype-dev

RUN ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip install --upgrade pip \
	&& pip install numpy==1.15.1 \
	&& pip install matplotlib==2.2.3 \
	&& apk del .build-deps

