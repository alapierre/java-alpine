FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>
ARG ARCHIVE_FILE=OpenJDK16-jdk_x64_alpine-linux_hotspot_16_36.tar.gz
ARG JDK_VERSION="jdk-16+36"

RUN apk add --update --no-cache java-cacerts fontconfig ttf-dejavu \
    && wget https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16%2B36/$ARCHIVE_FILE \
    && mkdir /usr/lib/jvm/ && cd /usr/lib/jvm \
    && tar -xzvf /$ARCHIVE_FILE \
    && ln -s "$JDK_VERSION/" default-jvm \
    && ln -s /usr/lib/jvm/default-jvm/bin/java /usr/bin/java \
    && rm /$ARCHIVE_FILE

ADD run-java.sh wait-for.sh /

CMD ["sh"]
