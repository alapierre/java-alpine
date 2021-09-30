FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk --no-cache add libx11 --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && apk --no-cache add openjdk17 --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing

ADD wait-for.sh /

CMD ["sh"]
