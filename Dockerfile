FROM alpine:3.12.1

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk add --upgrade musl musl-utils libcrypto1.1 libssl1.1 \
    && apk --no-cache add openjdk14-jdk --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

CMD ["sh"]
