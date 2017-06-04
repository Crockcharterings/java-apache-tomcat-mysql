FROM centos:7
MAINTAINER Cangol  <wxw404@gmail.com>

# Set correct environment variables
ENV HOME /home/app
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
ENV CATALINA_PID /var/run/tomcat7.pid
ENV CATALINA_SH /usr/share/tomcat7/bin/catalina.sh
ENV CATALINA_TMPDIR /tmp/tomcat7-tomcat7-tmp

# Allow app user to read /etc/container_environment
RUN useradd -d /home/app -m app && \
    usermod -a -G docker_env app

# Use baseimage-docker's init process
CMD ["/sbin/my_init"]

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get update && apt-get install -y wget && \
    apt-get install -yqq software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -yqq oracle-java8-installer && \
    apt-get install -yqq oracle-java8-set-default && \
    apt-get -yqq install tomcat7 maven && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

RUN ln -s /var/lib/tomcat7/common $CATALINA_HOME/common && \
    ln -s /var/lib/tomcat7/server $CATALINA_HOME/server && \
    ln -s /var/lib/tomcat7/shared $CATALINA_HOME/shared && \
    ln -s /etc/tomcat7 $CATALINA_HOME/conf && \
    mkdir $CATALINA_HOME/temp && \
    mkdir -p $CATALINA_TMPDIR && \
    chown -R app:app /usr/share/tomcat7 /var/lib/tomcat7 && \
    chmod -R 755 /usr/share/tomcat7 /var/lib/tomcat7

RUN rm -rf /var/lib/tomcat7/webapps/docs* && \
    rm -rf /var/lib/tomcat7/webapps/examples* && \
    rm -rf /var/lib/tomcat7/webapps/ROOT*

COPY tomcat7 /etc/default/tomcat7


VOLUME [ "/var/log/tomcat7/" ]
