#!/bin/bash
pid=`ps -ef|grep grabgeo|grep -v grep|awk '{print $2}'`
if [[ ! -z "$pid" ]] ;then
	kill -9 $pid
	echo "stop grabgeo pid: $pid"
fi

sleep 2
nohup python2.7 grabgeo.py &
if ps -ef|grep -q grabgeo; then
	pid=`ps -ef|grep grabgeo|grep -v grep|awk '{print $2}'`
	echo "start grabgeo pid: $pid"
fi
	
