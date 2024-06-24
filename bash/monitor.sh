#! /bin/bash
#
PATH_BIN=/root/lyj/grabgeo/scripts/bin
PATH_PID=grabgeo
PIDS=`ps -ef|grep $PATH_PID|grep -v grep|awk '{print $2}'`

if [ "$PIDS" != "" ]
then
echo -e "=====`date "+%Y-%m-%d %H:%M:%S"`===== $PATH_PID is running" >> /root/lyj/yunwei/script/log/monitor.log

else
cd $PATH_BIN
./restart.sh
echo -e "=====`date "+%Y-%m-%d %H:%M:%S"`===== $PATH_PID restart \n" >> /root/lyj/yunwei/script/log/monitor.log

fi
