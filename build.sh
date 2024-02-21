#!/bin/bash
VERSION=$1
echo "build hadoop image"
cd hadoop-cluster
docker build -t hadoop3-jdk8:$VERSION .
echo "build hive image"
cd ../hive
docker build -t hive-hadoop3:$VERSION .
echo "build spark image"
cd ../spark
docker build -t spark-hadoop3:$VERSION .
cd ../
sed -i '' -E "s/(hadoop3-jdk8|hive-hadoop3|spark-hadoop3):[0-9]+\.[0-9]+\.[0-9]+/\1:$VERSION/g" docker-compose.yml
