#!/bin/bash
docker stop $(docker ps -qa)
docker rm $(docker ps -qa)
docker rmi spring-boot-hello-world
rm -rf spring-boot-hello-world/
git clone https://github.com/Zarconite/spring-boot-hello-world
cd spring-boot-hello-world
mvn clean package
docker build -t spring-boot-hello-world:latest .
docker run -d -p 9000:9000 spring-boot-hello-world