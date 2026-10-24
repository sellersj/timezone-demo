# an old version of wildfly from 5+ years ago before it was moved
FROM docker.io/jboss/wildfly:25.0.0.Final

# Copy the compiled JAR file from the target directory into the container
COPY target/*.jar app.jar

# update the timezone

# set the jar to run on launch
ENTRYPOINT ["java", "-jar", "app.jar"]