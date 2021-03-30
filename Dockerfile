FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>

ENV JAVA_VERSION 8.275.01-r0

RUN apk add --update --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk add --no-cache openjdk8=$JAVA_VERSION

ADD run-java.sh calculate-memory.sh java-buildpack-memory-calculator /

CMD ["sh"]
