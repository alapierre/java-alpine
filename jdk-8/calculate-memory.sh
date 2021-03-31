#!/bin/sh

# Memory calculator for running Java applications in containers
# Usage:
#    # Execute a Java app:
#    ./calculate-memory.sh jar-file.jar
#
# Env-variables evaluated in this script:
# JAVA_OPTS: Java virtual machine options pass to java
# CONTAINER_MAX_MEMORY: if is set it will be not calculated from cgrups. If cgroups limit is not set, default value is 1024M

max_memory() {
  # High number which is the max limit until which memory is supposed to be
  # unbounded.
  local mem_file="/sys/fs/cgroup/memory/memory.limit_in_bytes"
  if [ -r "${mem_file}" ]; then
    local max_mem_cgroup="$(cat ${mem_file})"
    local max_mem_meminfo_kb="$(cat /proc/meminfo | awk '/MemTotal/ {print $2}')"
#    echo "$(cat /proc/meminfo | awk '/MemTotal/ {print $2}')"
    local max_mem_meminfo="$(expr $max_mem_meminfo_kb \* 1024)"
    if [ ${max_mem_cgroup:-0} != -1 ] && [ ${max_mem_cgroup:-0} -lt ${max_mem_meminfo:-0} ]
    then
      echo "${max_mem_cgroup}"
    fi
  fi
}

[ "$#" -eq 0 ] && { echo "$0: no jar file name provided"; exit 1; }

if [ -n "${CONTAINER_MAX_MEMORY}" ]; then
  echo "CONTAINER_MAX_MEMORY is set to $CONTAINER_MAX_MEMORY"
  totalMemory=$CONTAINER_MAX_MEMORY
else
  mem_limit="$(max_memory)"
  echo "calculated max memory: ${mem_limit}"
  if [ -n "${mem_limit}" ]; then
    totalMemory="${mem_limit}"
  else
    totalMemory=1024M
    echo "can't count CGroups memory limit, using default max memory value 1024M"
  fi
fi

fileSize=$(stat -c %s $1)
jarSizeInMB=$(($fileSize / 1024 / 1024))

CC=$((400*$jarSizeInMB))
threads=$((15+$jarSizeInMB*6/10))

printf "counted threads: %i counted classes to load %i memory %s\n" $threads $CC $totalMemory

args=`./java-buildpack-memory-calculator --loaded-class-count $CC --thread-count $threads --total-memory $totalMemory`

if [ $? -eq 0 ]; then
    echo "evaluated args: $args"
    export JAVA_MEMORY_OPTS="$args"
  else
    echo "calculation error code $? - $args"
    exit $?
fi


