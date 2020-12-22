## Java base on patched official alpine image with openjdk8 installed on it and no security vulnerabilities 

It contains useful entrypoint script `run-java.sh` to calculate Java memory options in container environment 

````
ENTRYPOINT ["/run-java.sh",  "/app.jar"]
````

Environment variables used by `run-java.sh`:

- `JAVA_OPTS` JVM options to pass to java. Setting JAVA_OPTS disable memory calculator
- `CONTAINER_MAX_MEMORY` if is set it will be not calculated from CGroups. If CGroups limit is not set, default value is 1024M

### How to build

```make build```

## Java Build Pack memory calculator licence

The Java Buildpack Memory Calculator is Open Source software released under the Apache 2.0 license.

## OpenJdk licence

This project is licenced on Apache 2.0 but OpenJDK licence is
GNU General Public License, version 2, with the Classpath Exception

https://openjdk.java.net/legal/gplv2+ce.html

## Trivi scan

```
trivy lapierre/java-alpine:8
2020-12-22T10:41:46.671+0100	INFO	Detecting Alpine vulnerabilities...
2020-12-22T10:41:46.673+0100	INFO	Trivy skips scanning programming language libraries because no supported file was detected

lapierre/java-alpine:8 (alpine 3.12.1)
======================================
Total: 0 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

```
