# Define base image.
FROM openjdk:8-jdk-alpine

# Entry point inside the container
WORKDIR  /usr/src/sample-maven-app

RUN mkdir conf

ADD target/spring-docker-poc.war .

ADD conf/sample-external-file.properties ./conf

#VOLUME /conf


#RUN java -jar target/spring-docker-poc.war --spring.config.location="sample-external-file.properties"
ENTRYPOINT [ "java","-jar","spring-docker-poc.war","--spring.config.location=conf/sample-external-file.properties" ]
#ENTRYPOINT [ "java","-jar","spring-docker-poc.war"]

# Expose port 8080
EXPOSE 8080