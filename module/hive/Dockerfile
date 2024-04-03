FROM hadoop3-jdk8:1.0.10

LABEL maintainer="async.me@outlook.com"

RUN mkdir -p /opt/bigdata/metastore/data

ADD lib/apache-hive-3.1.3-bin.tar.gz /usr/local/hive

ENV HIVE_HOME=/usr/local/hive/apache-hive-3.1.3-bin
ENV PATH=$HIVE_HOME/bin:$PATH

COPY config/hive/hive-site-metastore-server.xml $HIVE_HOME/conf/hive-site.xml
COPY lib/mysql-connector-j-8.3.0.jar $HIVE_HOME/lib/
COPY module/hive/shell/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
