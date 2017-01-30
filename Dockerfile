FROM maven:3-jdk-8
MAINTAINER Luis David Barrios <luisdavid.barrios@agsnasoft.com>

RUN apt-get update && apt-get install --no-install-recommends -y ruby ruby-dev build-essential rpm curl tar && rm -rf /var/lib/apt/lists/*

ENV SBT_VERSION 0.13.9
RUN curl -sL "http://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | tar -zx -C /usr/local/lib && ln -s /usr/local/lib/sbt/bin/sbt /usr/local/bin/sbt && sbt

RUN gem install fpm

RUN mkdir -p /var/src/project && chmod -R 777 /var/src
VOLUME /var/src/project
WORKDIR /var/src/project

CMD ["/bin/bash"]
