#!/bin/bash
VERSION=$1
sed -i '' -E "s/(hadoop3-jdk8|hive-hadoop3|client-hadoop3):[0-9]+\.[0-9]+\.[0-9]+/\1:$VERSION/g" docker-compose.yml hive/Dockerfile client/Dockerfile
echo "build hadoop image"
cd hadoop
docker build -t hadoop3-jdk8:$VERSION .
cd ../
echo "build hive image"
cd hive
docker build -t hive-hadoop3:$VERSION .
cd ../
echo "build client image"
cd client
docker build -t client-hadoop3:$VERSION .
cd ../
