FROM hive-hadoop3:1.0.9

LABEL maintainer="async.me@outlook.com"

RUN mkdir /home/data

ADD lib/spark-3.5.0-bin-hadoop3.tgz /usr/local/spark
ADD lib/flink-1.17.2-bin-scala_2.12.tgz /usr/local/flink

# for flink to use hadoop
RUN echo 'export HADOOP_CLASSPATH=$(hadoop classpath)' >> /etc/profile
RUN echo 'export HADOOP_CLASSPATH=$(hadoop classpath)' >> /etc/bash.bashrc

ENV SPARK_HOME=/usr/local/spark/spark-3.5.0-bin-hadoop3
ENV PATH=$SPARK_HOME/bin:$PATH

ENV FLINK_HOME=/usr/local/flink/flink-1.17.2
ENV PATH=$FLINK_HOME/bin:$PATH

# for hive client
COPY config/hive/hive-site-client.xml $HIVE_HOME/conf/hive-site.xml

# for spark to read hive
COPY config/hive/hive-site-metastore-server.xml $SPARK_HOME/conf/hive-site.xml
COPY lib/mysql-connector-j-8.3.0.jar $SPARK_HOME/jars/

# for spark to read hadoop
COPY config/hadoop/core-site.xml $SPARK_HOME/conf/core-site.xml
COPY config/hadoop/hdfs-site.xml $SPARK_HOME/conf/hdfs-site.xml

# for spark deploy on yarn
COPY config/spark/spark-env.sh $SPARK_HOME/conf/spark-env.sh

COPY module/client/shell/entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
