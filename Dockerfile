FROM alpine:3.6

MAINTAINER Kirill Kuznetsov <kir@evilmartians.com>

RUN apk add --no-cache ca-certificates openssl

RUN apk add --no-cache ruby ruby-bigdecimal ruby-json sqlite-libs libstdc++

ARG MAILCATCHER_VERSION=0.6.5

RUN apk add --no-cache --virtual .build-deps \
        ruby-dev \
        make g++ \
        sqlite-dev \
        && \
    gem install -v $MAILCATCHER_VERSION mailcatcher --no-ri --no-rdoc && \
    apk del .build-deps && \
    adduser -D mailcatcher

USER mailcatcher

EXPOSE 1025 1080

CMD ["mailcatcher", "--foreground", "--ip=0.0.0.0"]