#!/bin/bash
sed -i "s/\${MYSQL_PASSWORD}/$MYSQL_PASSWORD/g" ${SPARK_HOME}/conf/hive-site.xml
tail -f /dev/null
