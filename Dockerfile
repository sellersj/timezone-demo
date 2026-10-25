# an old version of wildfly from 5+ years ago before it was moved.
# Without an update this reports a timezone file of 2020a 
FROM docker.io/jboss/wildfly:25.0.0.Final

# Copy the compiled JAR file from the target directory into the container
COPY target/*.jar app.jar

# update the timezone
# can't update the yum command since the base image is EoL so the repos no longer work
# RUN yum update tzdata

# download and compile from scratch the tzdata
FROM centos:7

# Fix CentOS 7 repositories to point to the Vault since base repos are EOL
RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/CentOS-*.repo && \
    sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/CentOS-*.repo && \
    sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/CentOS-*.repo

# Install development tools needed to build tzdata
RUN yum install -y make gcc wget tar && \
    yum clean all

# Download, extract, compile, and install tzdata from IANA
RUN mkdir /tmp/tzdata && \
    cd /tmp/tzdata && \
    curl -sS -Ol https://cdn.azul.com/tools/ziupdater1.1.3.1-jse8+7-any_jvm.tar.gz && \
    tar -xzvf ziupdater*.tar.gz && \
    curl -sS -Ol https://data.iana.org/time-zones/tzdata-latest.tar.gz && \
    $JAVA_HOME/bin/java -jar ziupdater.jar -l file://./tzdata-latest.tar.gz

# Verify the timezone installation
RUN date

# set the jar to run on launch
ENTRYPOINT ["java", "-jar", "app.jar"]