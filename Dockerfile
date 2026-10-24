# an old version of wildfly from 5+ years ago before it was moved
FROM docker.io/jboss/wildfly:25.0.0.Final

# Copy the compiled JAR file from the target directory into the container
COPY target/*.jar app.jar

# run the jar, seeing the timezone version
RUN echo "About to print the version of java BEFORE updating the timezone"
RUN java -jar app.jar

# update the timezone

# run the jar again printing the version
RUN echo "About to print the version of java AFTER updating the timezone"
RUN java -jar app.jar
