FROM alpine:3.12.1

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk add --upgrade musl musl-utils \
    && apk --no-cache add openjdk15 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

CMD ["sh"]
