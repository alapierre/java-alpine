#!/bin/sh

# Generic startup script for running Java applications in containers
# Usage:
#    # Execute a Java app:
#    ./run-java.sh jar-file.jar
#
# Env-variables evaluated in this script:
# JAVA_OPTS: Java virtual machine options pass to java. Setting JAVA_OPTS prevent to use memory calculator
# CONTAINER_MAX_MEMORY: if is set it will be not calculated from CGroups. If CGroups limit is not set, default value is 1024M

EXTRA_JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1"
DEFAULT_JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"

if [ -z "$JAVA_OPTS" ]; then
  echo "JAVA_OPTS not set - using memory calculator"
  . ./calculate-memory.sh
  exec_cmd="exec java $JAVA_MEMORY_OPTS $EXTRA_JAVA_OPTS $DEFAULT_JAVA_OPTS -jar $@"
else
  echo "using provided JAVA_OPTS $JAVA_OPTS"
  exec_cmd="exec java $JAVA_OPTS $DEFAULT_JAVA_OPTS -jar $@"
fi

echo "running java as: $exec_cmd"
eval "$exec_cmd"



