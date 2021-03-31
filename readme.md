## Java base on security patched official alpine image with varius Open JDK installed on it and no security vulnerabilities 

### JDK 8

Multi arch Docker image, with useful entrypoint script `run-java.sh` to calculate Java memory options in container environment 

````
ENTRYPOINT ["/run-java.sh",  "/app.jar"]
````

Environment variables used by `run-java.sh`:

- `JAVA_OPTS` JVM options to pass to java. Setting JAVA_OPTS disable memory calculator
- `CONTAINER_MAX_MEMORY` if is set it will be not calculated from CGroups. If CGroups limit is not set, default value is 1024M

### JDK 11

### JDK 14

### JDK 15

### JDK 16 (AdoptOpenJDK)

Only `amd64`

## How to build

```make build```

## Trivi scan

```
trivy lapierre/java-alpine:16
2021-03-31T21:06:52.339+0200	INFO	Detecting Alpine vulnerabilities...
2021-03-31T21:06:52.339+0200	INFO	Trivy skips scanning programming language libraries because no supported file was detected

lapierre/java-alpine:16 (alpine 3.13.3)
=======================================
Total: 0 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

```

## Java Build Pack memory calculator licence

The Java Buildpack Memory Calculator is Open Source software created by CloudFoundry Foundation, released under the Apache 2.0 license.

https://github.com/cloudfoundry/java-buildpack-memory-calculator

## OpenJdk licence

This project is licenced on Apache 2.0 but OpenJDK licence is
GNU General Public License, version 2, with the Classpath Exception

https://openjdk.java.net/legal/gplv2+ce.html
