#!/bin/bash
case $NODE_TYPE in
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
