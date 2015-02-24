# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
# See https://github.com/phusion/baseimage-docker
FROM phusion/baseimage:0.9.16
MAINTAINER Michael Meisinger <michael.meisinger@gmail.com>

ENV HOME=/root
WORKDIR $HOME

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Basic stuff
RUN apt-get update && apt-get install -y --no-install-recommends \
        git git-core vim build-essential \
        python-pip python-virtualenv virtualenvwrapper \
        python2.7 python2.7-dev python python-all-dev

# Special libs for psycopg2, readline, lxml, M2Crypto, bcrypt
RUN apt-get update && apt-get install -y --no-install-recommends \
        libev-dev libffi-dev libpq-dev libxml2-dev libxslt1-dev libzmq-dev ncurses-dev swig

# Java based stuff
#RUN apt-get install -y --no-install-recommends ant ant-optional

RUN apt-get update && apt-get upgrade -y
