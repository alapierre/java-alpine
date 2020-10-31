FROM alpine:3.12

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk add --no-cache --upgrade openjdk11-jdk

CMD ["sh"]
