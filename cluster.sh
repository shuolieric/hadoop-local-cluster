#!/bin/bash
source config/cluster-env.sh
ACTION=$1
case "$ACTION" in
'start')
	echo "cluster start"
	docker-compose up -d
	;;
'stop')
	echo "cluster stop"
	docker-compose down
	;;
*)
	echo "wrong action"
	;;
esac
