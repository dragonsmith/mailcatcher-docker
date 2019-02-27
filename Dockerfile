FROM ruby:2.6.1-alpine3.9

LABEL maintainer="Kirill Kuznetsov <kir@evilmartians.com>"

RUN apk add --no-cache ca-certificates openssl sqlite-libs libstdc++

ARG MAILCATCHER_VERSION=0.7.0

RUN apk add --no-cache --virtual .build-deps \
        ruby-dev make g++ sqlite-dev \
        && \
    gem install --no-document -v $MAILCATCHER_VERSION mailcatcher && \
    apk del .build-deps

RUN adduser -D mailcatcher

USER mailcatcher

EXPOSE 1025 1080

CMD ["mailcatcher", "--foreground", "--ip=0.0.0.0"]
