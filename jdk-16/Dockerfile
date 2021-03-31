FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --update --no-cache java-cacerts fontconfig ttf-dejavu \
    && wget https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16%2B36/OpenJDK16-jdk_x64_alpine-linux_hotspot_16_36.tar.gz \
    && mkdir /usr/lib/jvm/ && cd /usr/lib/jvm \
    && tar -xzvf /OpenJDK16-jdk_x64_alpine-linux_hotspot_16_36.tar.gz \
    && ln -s "jdk-16+36/" default-jvm \
    && ln -s /usr/lib/jvm/default-jvm/bin/java /usr/bin/java \
    && rm /OpenJDK16-jdk_x64_alpine-linux_hotspot_16_36.tar.gz

CMD ["sh"]
