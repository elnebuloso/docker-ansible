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

COPY docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN echo "configure scripts" \
    && find /usr/local/bin -type f -name '*.sh' | while read f; do mv "$f" "${f%.sh}"; done \
    && chmod +x /usr/local/bin/*

ENTRYPOINT ["docker-entrypoint"]
CMD ["--help"]