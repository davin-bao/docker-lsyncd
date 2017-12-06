FROM alpine:latest

MAINTAINER Davin Bao <davin.bao@gmail.com>

RUN set -x \
    && apk add --update bash openssh lsyncd


RUN set -x \
    && mkdir /data

COPY conf/lsyncd.conf /etc/

RUN set -x \
    && mkdir -p /root/.ssh \
    && chmod 700 /root/.ssh \
    && sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config

COPY entrypoint.sh / 

RUN set -x \
    && chmod +x /entrypoint.sh

VOLUME ["/data", "/root/.ssh"]

CMD ["/entrypoint.sh"]
