FROM centos:latest

MAINTAINER Kirill Kuznetsov <kir@evilmartians.com>

ENV MAILCATCHER_VERSION=0.6.5

RUN yum -y upgrade && \
    yum -y install ruby rubygem-bigdecimal rubygem-json \
                   ruby-devel make gcc-c++ sqlite-devel && \
    gem install -v $MAILCATCHER_VERSION mailcatcher --no-ri --no-rdoc && \
    yum -y clean all && \
    useradd mailcatcher

USER mailcatcher

EXPOSE 1025 1080

CMD ["mailcatcher", "--foreground", "--ip=0.0.0.0"]