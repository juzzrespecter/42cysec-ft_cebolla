FROM alpine:latest

COPY ./config/docker-entrypoint.sh /tmp/

RUN apk update \
    && apk add --no-cache \
            bash \
            openrc \
            tor \
    && mkdir -p /run/openrc/ \
    && touch /run/openrc/softlevel \
    && openrc \
    && rm /etc/tor/torrc.sample \
    && chmod +x /tmp/docker-entrypoint.sh

COPY ./config/torrc /etc/tor/

WORKDIR /tmp/

CMD ./docker-entrypoint.sh
