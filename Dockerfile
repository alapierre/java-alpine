FROM alpine:3.12.1

MAINTAINER Adrian Lapierre <al@alapierre.io>

ENV JAVA_VERSION 8.252.09-r0

RUN apk add --no-cache java-cacerts \
    && apk add --upgrade musl musl-utils nss libcrypto1.1 libssl1.1 p11-kit-trust p11-kit \
    && apk --update add fontconfig ttf-dejavu \
    && apk add openjdk8=$JAVA_VERSION

CMD ["sh"]
