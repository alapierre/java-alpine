FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk add --no-cache --upgrade openjdk11-jdk

ADD run-java.sh wait-for.sh /

CMD ["sh"]
