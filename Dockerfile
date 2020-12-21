FROM lapierre/alpine:3.12.1

MAINTAINER Adrian Lapierre <al@alapierre.io>

ENV JAVA_VERSION 8.252.09-r0

RUN apk add --update --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk add --no-cache openjdk8=$JAVA_VERSION

#    && wget https://raw.githubusercontent.com/alapierre/run-java/main/run-java.sh

ADD run-java.sh calculate-memory.sh java-buildpack-memory-calculator /

CMD ["sh"]
