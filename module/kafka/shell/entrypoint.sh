#!/bin/bash
case $NODE_TYPE in
"broker01")
	echo "modify kafka config"
	sed -i -r "s/(broker\.id=)[0-9]/\11/" $KAFKA_HOME/config/server.properties
	kafka-server-start.sh $KAFKA_HOME/config/server.properties
	;;
"broker02")
	echo "modify kafka config"
	sed -i -r "s/(broker\.id=)[0-9]/\12/" $KAFKA_HOME/config/server.properties
	kafka-server-start.sh $KAFKA_HOME/config/server.properties
	;;
"broker03")
	echo "modify kafka config"
	sed -i -r "s/(broker\.id=)[0-9]/\13/" $KAFKA_HOME/config/server.properties
	kafka-server-start.sh $KAFKA_HOME/config/server.properties
	;;
*)
	echo "No specific kafka role defined for NODE_TYPE=$NODE_TYPE"
	;;
esac

# 保持容器运行
tail -f /dev/null
