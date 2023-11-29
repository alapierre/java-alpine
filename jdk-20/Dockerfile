FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk --no-cache add libx11 --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && apk --no-cache add openjdk20 --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community

COPY ssl ./

RUN keytool -importcert -alias Entrust_Root_G2 -file Entrust_Root_Certification_Authority_G2.cer -storepass changeit -cacerts -noprompt && \
    keytool -importcert -alias Entrust_L1K -file Entrust_Certification_Authority_L1K.cer -storepass changeit -cacerts -noprompt

ADD wait-for.sh /

CMD ["sh"]
