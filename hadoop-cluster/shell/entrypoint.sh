#!/bin/bash
HADOOP_DATA_DIR=/opt/bigdata/hadoop3/data
case $NODE_TYPE in
"namenode")
	echo "Starting NameNode..."
	if [ ! -d "$HADOOP_DATA_DIR/namenode" ]; then
		echo "Formatting NameNode..."
		hdfs namenode -format
	fi
	hdfs namenode
	;;

"datanode")
	echo "Starting DataNode..."
	hdfs datanode
	;;

"metastore")
	echo "Starting metastore service..."
	if [ ! -f $HIVE_HOME/flagfile ]; then
		schematool -dbType mysql -initSchema
		touch $HIVE_HOME/flagfile
	fi
	hive --service metastore
	;;
*)
	echo "No specific Hadoop role defined for NODE_TYPE=$NODE_TYPE"
	;;
esac

# 保持容器运行
tail -f /dev/null
