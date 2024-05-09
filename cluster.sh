#!/bin/bash
source config/cluster-env.sh
ACTION=$1
CLUSTER=$2
case "$ACTION" in
'start')
	echo "cluster start"
	docker-compose -f $CLUSTER-docker-compose.yml up -d
	;;
'stop')
	echo "cluster stop"
	docker-compose -f $CLUSTER-docker-compose.yml down
	;;
*)
	echo "wrong action"
	;;
esac
