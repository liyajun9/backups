#!/bin/bash

cd /home/common/common/FACTORY_MANAGE/scripts/bin || exit

LOG_DIR="/data/manage"
MANAGE_LOG_FILE="manage.log"
REQUESTS_LOG_FILE="requests.log"
# 1GB
MAX_FILE_SIZE=1073741824
MAX_LOGS=200
timestamp=$(date +'%Y%m%d')
manage_current_size=$(stat -c%s "${LOG_DIR}/${MANAGE_LOG_FILE}")
requests_current_size=$(stat -c%s "${LOG_DIR}/${REQUESTS_LOG_FILE}")

# rotate manage.log
if [ "$manage_current_size" -gt "$MAX_FILE_SIZE" ]; then
	echo "Log file size ($manage_current_size bytes) exceeded $MAX_FILE_SIZE bytes. Rotating logs..."
	
	mv "$LOG_DIR/$MANAGE_LOG_FILE" "$LOG_DIR/${MANAGE_LOG_FILE}_$timestamp"
	
	#gzip "$LOG_DIR/${MANAGE_LOG_FILE}_$timestamp"
	
	touch "$LOG_DIR/$MANAGE_LOG_FILE"
	echo "Log file rotated: ${MANAGE_LOG_FILE}_$timestamp, restart application"
	
	./restart.sh
	
	rotated_logs=($(ls -t $LOG_DIR/${MANAGE_LOG_FILE}_*))
	if [ ${#rotated_logs[@]} -gt $MAX_LOGS ]; then
		for ((i=$MAX_LOGS; i<${#rotated_logs[@]}; i++)); do
		    rm "${rotated_logs[$i]}"
		    echo "Deleted old log: ${rotated_logs[$i]}"
		done
	fi
else
	echo "Manage Log file size is within $MAX_FILE_SIZE bytes. nothing todo..."
fi

# rotate request.log
if [ "$requests_current_size" -gt "$MAX_FILE_SIZE" ]; then
	echo "Log file size ($requests_current_size bytes) exceeded $MAX_FILE_SIZE bytes. Rotating logs..."
	
	mv "$LOG_DIR/$REQUESTS_LOG_FILE" "$LOG_DIR/${REQUESTS_LOG_FILE}_$timestamp"
	
	#gzip "$LOG_DIR/${REQUESTS_LOG_FILE}_$timestamp"
	
	touch "$LOG_DIR/$REQUESTS_LOG_FILE"
	echo "Log file rotated: ${REQUESTS_LOG_FILE}_$timestamp, restart application"
	
	./restart.sh
	
	rotated_logs=($(ls -t $LOG_DIR/${REQUESTS_LOG_FILE}_*))
	if [ ${#rotated_logs[@]} -gt $MAX_LOGS ]; then
		for ((i=$MAX_LOGS; i<${#rotated_logs[@]}; i++)); do
		    rm "${rotated_logs[$i]}"
		    echo "Deleted old log: ${rotated_logs[$i]}"
		done
	fi
else
	echo "Request Log file size is within $MAX_FILE_SIZE bytes. nothing todo..."
fi

