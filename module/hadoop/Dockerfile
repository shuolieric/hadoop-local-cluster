FROM ubuntu:22.04

LABEL maintainer="async.me@outlook.com"

RUN apt-get update \
    && apt-get install -y vim \
    && apt-get install -y netcat \
    && apt-get install -y inetutils-ping \
    && apt-get install -y telnet \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/bigdata/hadoop3/data

ADD lib/jdk-8u401-linux-aarch64.tar.gz /usr/local/jdk
ADD lib/hadoop-3.3.6-aarch64.tar.gz /usr/local/hadoop

ENV JAVA_HOME=/usr/local/jdk/jdk1.8.0_401
ENV PATH=$JAVA_HOME/bin:$PATH

ENV HADOOP_HOME=/usr/local/hadoop/hadoop-3.3.6
ENV PATH=$HADOOP_HOME/bin:$PATH

COPY config/hadoop/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY config/hadoop/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
COPY config/hadoop/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
COPY config/hadoop/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
COPY module/hadoop/shell/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
