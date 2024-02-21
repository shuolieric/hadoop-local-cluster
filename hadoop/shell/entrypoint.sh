#!/bin/bash
HADOOP_DATA_DIR=/opt/bigdata/hadoop3/data
case $NODE_TYPE in
"namenode")
	if [ ! -d "$HADOOP_DATA_DIR/namenode" ] || [ -z "$(ls -A $HADOOP_DATA_DIR/namenode)" ]; then
		echo "Formatting NameNode..."
		hdfs namenode -format
	fi
	echo "Starting NameNode..."
	hdfs namenode
	;;

"datanode")
	echo "Starting DataNode..."
	hdfs datanode
	;;
*)
	echo "No specific Hadoop role defined for NODE_TYPE=$NODE_TYPE"
	;;
esac

# 保持容器运行
tail -f /dev/null
