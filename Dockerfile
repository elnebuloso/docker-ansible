FROM ubuntu:18.04
MAINTAINER jeff.tunessen@gmail.com

ARG DEBIAN_FRONTEND=noninteractive

RUN echo "install ansible" \
    && apt-get update \
    && apt-get install -y software-properties-common ca-certificates \
    && add-apt-repository ppa:ansible/ansible \
    && apt-get update \
    && apt-get install -y ansible \
    && mkdir -p /.ansible/tmp \
    && chmod 777 -R /.ansible/tmp \
    && apt-get -y autoremove \
    && apt-get -y autoclean \
    && apt-get -y clean \
    && rm -rf /tmp/*

# sleep infinity, use container as running system
CMD ["tail", "-f", "/dev/null"]