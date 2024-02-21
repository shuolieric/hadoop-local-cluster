FROM hive-hadoop3:1.0.1

LABEL maintainer="async.me@outlook.com"

ADD lib/spark-3.5.0-bin-hadoop3.tgz /usr/local/spark

ENV SPARK_HOME /usr/local/spark/spark-3.5.0-bin-hadoop3
ENV PATH $SPARK_HOME/bin:$PATH

COPY config/core-site.xml $SPARK_HOME/conf/core-site.xml
COPY config/hdfs-site.xml $SPARK_HOME/conf/hdfs-site.xml
COPY config/mapred-site.xml $SPARK_HOME/conf/mapred-site.xml
COPY config/yarn-site.xml $SPARK_HOME/conf/yarn-site.xml
COPY config/hive-site.xml $SPARK_HOME/conf/hive-site.xml
COPY lib/mysql-connector-j-8.3.0.jar $SPARK_HOME/lib/
COPY shell/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
