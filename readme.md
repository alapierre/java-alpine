## Java base on security patched official alpine image with varius Open JDK installed on it and no security vulnerabilities 
 
### JDK 8

`amd64` `arm/v7` (interpreter mode IceTee Java implementation) and `arm64`

Multi arch Docker image, with useful entrypoint script `run-java.sh`, `wait-for.sh` and memory calculator to calculate Java memory 
options in container environment 

Sample Dockerfile

```dockerfile
FROM lapierre/java-alpine:8

EXPOSE 8080
ARG JAR_FILE
ADD ${JAR_FILE} app.jar

RUN addgroup -g 10001 -S app && adduser -u 10001 -S -G app app

USER app

ENTRYPOINT ["/run-java.sh",  "/app.jar"]
```

Environment variables used by `run-java.sh`:

- `JAVA_OPTS` JVM options to pass to java. Setting JAVA_OPTS disable memory calculator
- `CONTAINER_MAX_MEMORY` if is set it will be not calculated from CGroups. If CGroups limit is not set, default value is 1024M

### JDK 11

`amd64` and `arm64`

### JDK 14

`amd64` and `arm64`

### JDK 15

`amd64` and `arm64`

### JDK 16 (AdoptOpenJDK)

Only `amd64`

## Trivi scan

```
trivy image lapierre/alpine:3
2022-04-20T14:18:35.301+0200	INFO	Detected OS: alpine
2022-04-20T14:18:35.301+0200	INFO	Detecting Alpine vulnerabilities...
2022-04-20T14:18:35.302+0200	INFO	Number of language-specific files: 0

lapierre/alpine:3 (alpine 3.15.4)
=================================
Total: 0 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 0, CRITICAL: 0)


```

## Java Build Pack memory calculator licence

The Java Buildpack Memory Calculator is Open Source software created by CloudFoundry Foundation, released under the Apache 2.0 license.

https://github.com/cloudfoundry/java-buildpack-memory-calculator

## `wait-for.sh` licence

MIT Licensed originally from: https://github.com/mrako/wait-for

## OpenJdk licence

This project is licenced on Apache 2.0 but OpenJDK licence is
GNU General Public License, version 2, with the Classpath Exception

https://openjdk.java.net/legal/gplv2+ce.html
