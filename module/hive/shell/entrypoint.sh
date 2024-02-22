#!/bin/bash
HIVE_METASTORE_DATA_DIR=/opt/bigdata/metastore/data
sed -i "s/\${MYSQL_PASSWORD}/$MYSQL_PASSWORD/g" ${HIVE_HOME}/conf/hive-site.xml
if [ ! -d $HIVE_METASTORE_DATA_DIR ] || [ -z "$(ls -A $HIVE_METASTORE_DATA_DIR)" ]; then
	echo "init metastore schema"
	schematool -dbType mysql -initSchema
	touch $HIVE_METASTORE_DATA_DIR/flagfile
fi
echo "Starting metastore service..."
hive --service metastore

# 保持容器运行
tail -f /dev/null
