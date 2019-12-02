# Create a docker-maven instance and assign MAVEN_BUILD as alias.
# FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

# From the current directory, transfer the pom.xml inside the /build/ directory of container.
# COPY pom.xml /build/

# Copy the source code from the current directory to /build/src inside the container.
# COPY src /build/src/

# Go to the /build/ directory of the container.
# WORKDIR /build/

# Run maven command.
# RUN mvn clean package

# Define base image where the compiled source code would be deployed.
FROM openjdk:8-jdk-alpine

# Entry point inside the deploy container
WORKDIR  /usr/src/sample-maven-app

# Create conf directory for volume mapping.
RUN mkdir conf

# From the BUILD container, copy the war file to the current directory in the DEPLOY container.
# COPY --from=MAVEN_BUILD /build/target/spring-docker-poc.war .
ADD target/spring-docker-poc.war /build/target/spring-docker-poc.war

# Create a dummy file for property so error would not manifest.
ADD conf/sample-external-file.properties ./conf

# Run the spring application using the defined property file.
ENTRYPOINT [ "java","-jar","/build/target/spring-docker-poc.war","--spring.config.location=conf/sample-external-file.properties" ]

# Expose port 8080
EXPOSE 8080