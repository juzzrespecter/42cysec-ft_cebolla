FROM alpine:latest

COPY ./config/docker-entrypoint.sh /tmp/

RUN apk update \
    && apk add --no-cache \
            nginx \
            openssh \
            bash \
            openrc \
    && mkdir -p /run/openrc/ \
    && touch /run/openrc/softlevel \
    && openrc \
    && adduser -S admin --shell /bin/sh \
    && echo admin:1234 | chpasswd \
    && chmod +x /tmp/docker-entrypoint.sh

COPY ./config/nginx.conf /etc/nginx/
COPY ./config/index.html /var/www/localhost/
COPY ./config/ssh_config /etc/ssh/sshd_config

WORKDIR /tmp/

CMD ./docker-entrypoint.sh
