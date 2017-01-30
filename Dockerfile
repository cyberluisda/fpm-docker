FROM node:6
MAINTAINER Luis David Barrios <luisdavid.barrios@agsnasoft.com>

RUN apt-get update -y && apt-get install -y ruby ruby-dev build-essential rpm curl openssh-client && rm -rf /var/lib/apt/lists/*
RUN gem install fpm

RUN mkdir -p /var/src/project && chmod -R 777 /var/src
VOLUME /var/src/project
WORKDIR /var/src/project

CMD ["/bin/bash"]
