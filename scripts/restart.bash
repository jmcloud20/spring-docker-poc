#!/bin/bash
# Author: Joseph M. Garcia
# Date: 12/02/2019
# Description: execute to run maven + docker image
# Date Modified: 12/02/2019

echo -- make sure container sample-maven-app is not running.
docker stop sample-maven-app

echo -- run deploy-image to create container.
docker run -p 8080:8080 -v d:/tmp/sample-maven-app:/usr/src/sample-maven-app/conf --name=sample-maven-app --rm jmgarcia214/sample-maven-app