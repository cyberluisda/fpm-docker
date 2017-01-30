FROM centos:7
MAINTAINER Luis David Barrios <luisdavid.barrios@agsnasoft.com>

RUN yum install -y epel-release && yum install -y openssh openssh-clients curl ruby-devel ruby python34 python34-devel python34-setuptools python-pip curl && yum groupinstall -y "Development Tools" && yum clean all
RUN pip install --upgrade virtualenv
RUN gem install fpm

RUN mkdir -p /var/src/project && chmod -R 777 /var/src
VOLUME /var/src/project
WORKDIR /var/src/project

CMD ["/bin/bash"]
