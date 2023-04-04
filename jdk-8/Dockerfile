FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>

ARG JAVA_VERSION

RUN apk add --update --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk add --no-cache openjdk8=$JAVA_VERSION --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    && apk add --no-cache -u libpng --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main

ADD run-java.sh calculate-memory.sh java-buildpack-memory-calculator /

CMD ["sh"]
