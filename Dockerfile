FROM java:8-jdk
MAINTAINER Luis David Barrios <luisdavid.barrios@agsnasoft.com>

RUN apt-get update && apt-get install --no-install-recommends -y ruby ruby-dev build-essential rpm curl tar && rm -rf /var/lib/apt/lists/*

ENV IVY_VERSION 2.4.0

RUN curl -sL "http://mirrors.whoishostingthis.com/apache//ant/ivy/$IVY_VERSION/apache-ivy-${IVY_VERSION}-bin.tar.gz" | tar -zx -C /usr/local/lib && rm -fr /usr/local/lib/apache-ivy-${IVY_VERSION}/src && ln -s /usr/local/lib/apache-ivy-${IVY_VERSION}/ivy-${IVY_VERSION}.jar /usr/share/java/ivy.jar

RUN gem install fpm

RUN mkdir -p /var/src/project && chmod -R 777 /var/src
VOLUME /var/src/project
WORKDIR /var/src/project

CMD ["/bin/bash"]
