#!/bin/bash
# Author: Joseph M. Garcia
# Date: 12/02/2019
# Description: execute to run maven + docker image
# Date Modified: 12/02/2019

# process

echo -- make sure container sample-maven-app is not running.
docker stop sample-maven-app

echo -- make sure image sample-maven-app does not exist.
docker rmi jmgarcia214/sample-maven-app

echo -- run maven test
mvn test

echo -- run maven build
mvn clean package

echo -- build image using Dockerfile. 
docker build . -t jmgarcia214/sample-maven-app

echo -- run deploy-image to create container.
docker run -p 8080:8080 -v d:/tmp/sample-maven-app:/usr/src/sample-maven-app/conf --name=sample-maven-app --rm jmgarcia214/sample-maven-app