FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk --no-cache add openjdk14-jdk --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

CMD ["sh"]
