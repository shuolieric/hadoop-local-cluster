#!/bin/bash
HADOOP_DATA_DIR=/opt/bigdata/hadoop3/data
case $NODE_TYPE in
"master")
	if [ ! -d "$HADOOP_DATA_DIR/namenode" ] || [ -z "$(ls -A $HADOOP_DATA_DIR/namenode)" ]; then
		echo "Formatting NameNode..."
		hdfs namenode -format
	fi
	echo "Starting NameNode..."
	hdfs namenode &
	echo "Starting resourcemanager"
	yarn resourcemanager
	;;

"worker")
	echo "Starting DataNode..."
	hdfs datanode &
	echo "Starting nodemanager"
	yarn nodemanager
	;;
*)
	echo "No specific Hadoop role defined for NODE_TYPE=$NODE_TYPE"
	;;
esac

# 保持容器运行
tail -f /dev/null
