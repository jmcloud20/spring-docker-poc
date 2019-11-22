FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

COPY pom.xml /build/

COPY src /build/src/

WORKDIR /build/

RUN mvn clean package

# Define base image.
FROM openjdk:8-jdk-alpine

# Entry point inside the container
WORKDIR  /usr/src/sample-maven-app

RUN mkdir conf

COPY --from=MAVEN_BUILD /build/target/spring-docker-poc.war .

ADD conf/sample-external-file.properties ./conf

# Run the spring application using the defined property file.
ENTRYPOINT [ "java","-jar","spring-docker-poc.war","--spring.config.location=conf/sample-external-file.properties" ]

# Expose port 8080
EXPOSE 8080