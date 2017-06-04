# java-apache-tomcat-mysql
[![java-apache-tomcat-mysql](http://dockeri.co/image/cangol/java-apache-tomcat-mysql)](https://hub.docker.com/r/cangol/java-apache-tomcat-mysql/)

## Included
* OpenJDK 7
* tomcat 7

## Build image

```bash
docker build -t cangol/java-apache-tomcat-mysql .
```

## Push build version to repository

```bash
docker push cangol/java-apache-tomcat-mysql
```

## Usage

### GitLab CI

This is what my .gitlab-ci.yml looks like:

```yaml
image: cangol/java-apache-tomcat-mysql
stages:
  - build

```

### Without GitLab

```bash
docker pull cangol/java-apache-tomcat-mysql
```

Change directory to your project directory, then run:

```bash
```

