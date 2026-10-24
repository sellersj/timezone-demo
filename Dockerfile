FROM eclipse-temurin:8-jre-alpine

# Copy the compiled JAR file from the target directory into the container
COPY target/*.jar app.jar

# run the jar, seeing the timezone version

# update the timezone

# run the jar again printing the version


