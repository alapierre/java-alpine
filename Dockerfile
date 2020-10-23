FROM alpine:3.12.1

MAINTAINER Adrian Lapierre <al@alapierre.io>

ENV JAVA_VERSION 8.252.09-r0

RUN apk add --no-cache java-cacerts \
    && apk --update add fontconfig ttf-dejavu \
    && apk add openjdk8=$JAVA_VERSION

CMD ["sh"]
