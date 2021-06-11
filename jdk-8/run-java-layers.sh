#!/bin/sh

# Generic startup script for running Spring Boot layered applications in containers
# Usage:
#    # Execute a Java app:
#    ./run-java-layers.sh
#
# Env-variables evaluated in this script:
# JAVA_OPTS: Java virtual machine options pass to java

[ -z "$JAVA_OPTS" ] && echo "JAVA_OPTS not set"

if [ -z "$JAVA_OPTS" ]; then
  echo "running java with NO JAVA_OPTS as:" exec java org.springframework.boot.loader.JarLauncher "$@"
  exec java org.springframework.boot.loader.JarLauncher "$@"
else
  echo "running java with JAVA_OPTS as:" exec java "$JAVA_OPTS" org.springframework.boot.loader.JarLauncher "$@"
  exec java "$JAVA_OPTS" org.springframework.boot.loader.JarLauncher "$@"
fi
