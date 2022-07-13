FROM alpine:latest

COPY ./config/docker-entrypoint.sh /tmp/

RUN apk update \
    && apk add nginx \
            openssh \
            bash \
            openrc \
            tor \
    && mkdir -p /run/openrc/ \
    && touch /run/openrc/softlevel \
    && rm /etc/tor/torrc.sample \
    && chmod +x /tmp/docker-entrypoint.sh

COPY ./config/nginx.conf /etc/nginx/
COPY ./config/index.html /var/www/localhost/
COPY ./config/ssh_config /etc/ssh/sshd_config
COPY ./config/torrc /etc/tor/

WORKDIR /tmp/

CMD ./docker-entrypoint.sh