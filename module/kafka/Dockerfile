FROM ubuntu:22.04

LABEL maintainer="async.me@outlook.com"

RUN apt-get update \
    && apt-get install -y vim \
    && apt-get install -y netcat \
    && apt-get install -y inetutils-ping \
    && apt-get install -y telnet \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/bigdata/zookeeper/data
RUN mkdir -p /opt/bigdata/kafka/data

ADD lib/jdk-17_linux-aarch64_bin.tar.gz /usr/local/jdk
ADD lib/apache-zookeeper-3.8.3-bin.tar.gz /usr/local/zookeeper
ADD lib/kafka_2.13-3.6.1.tgz /usr/local/kafka

ENV JAVA_HOME=/usr/local/jdk/jdk-17.0.10
ENV PATH=$JAVA_HOME/bin:$PATH

ENV ZOOKEEPER_HOME=/usr/local/zookeeper/apache-zookeeper-3.8.3-bin
ENV PATH=$ZOOKEEPER_HOME/bin:$PATH

ENV KAFKA_HOME=/usr/local/kafka/kafka_2.13-3.6.1
ENV PATH=$KAFKA_HOME/bin:$PATH

COPY config/zookeeper/zoo.cfg /$ZOOKEEPER_HOME/conf/zoo.cfg
COPY config/kafka/server.properties /$KAFKA_HOME/config/server.properties
COPY module/kafka/shell/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
