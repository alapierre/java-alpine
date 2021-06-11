#!/bin/sh

# Generic startup script for running Java applications in containers
# Usage:
#    # Execute a Java app:
#    ./run-java.sh jar-file.jar
#
# Env-variables evaluated in this script:
# JAVA_OPTS: Java virtual machine options pass to java

[ -z "$JAVA_OPTS" ] && echo "JAVA_OPTS not set"

if [ -z "$JAVA_OPTS" ]; then
  echo "running java with NO JAVA_OPTS  as:" exec java -Djava.security.egd=file:/dev/./urandom -jar "$@"
  exec java -Djava.security.egd=file:/dev/./urandom -jar "$@"
else
  echo "running java with JAVA_OPTS as:" exec java "$JAVA_OPTS" -Djava.security.egd=file:/dev/./urandom -jar "$@"
  exec java "$JAVA_OPTS" -Djava.security.egd=file:/dev/./urandom -jar "$@"
fi

