#!/bin/bash
VERSION=$1
sed -i '' -E "s/(hadoop3-jdk8|hive-hadoop3|client-hadoop3):[0-9]+\.[0-9]+\.[0-9]+/\1:$VERSION/g" docker-compose.yml module/hive/Dockerfile module/client/Dockerfile
echo "build hadoop image"
docker build -t hadoop3-jdk8:$VERSION -f module/hadoop/Dockerfile .
echo "build hive image"
docker build -t hive-hadoop3:$VERSION -f module/hive/Dockerfile .
echo "build client image"
docker build -t client-hadoop3:$VERSION -f module/client/Dockerfile .
