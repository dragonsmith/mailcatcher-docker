FROM ruby:2.5.3-alpine3.7

LABEL maintainer="Kirill Kuznetsov <kir@evilmartians.com>"

RUN apk add --no-cache ca-certificates openssl sqlite-libs libstdc++

ARG MAILCATCHER_VERSION=0.6.5

RUN apk add --no-cache --virtual .build-deps \
        ruby-dev make g++ sqlite-dev \
        && \
    gem install -v $MAILCATCHER_VERSION mailcatcher --no-ri --no-rdoc && \
    apk del .build-deps

RUN adduser -D mailcatcher

USER mailcatcher

EXPOSE 1025 1080

CMD ["mailcatcher", "--foreground", "--ip=0.0.0.0"]
