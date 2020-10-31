FROM alpine:edge

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk add --no-cache --upgrade openjdk14-jdk

CMD ["sh"]
