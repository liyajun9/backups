#!/bin/bash

./stop.sh

mv db.py db.py_old
mv firmwarelog.py firmwarelog.py_old
mv log_route.py log_route.py_old

mv db.py_new db.py
mv firmwarelog.py_new firmwarelog.py
mv log_route.py_new log_route.py

rm ../var/log/manage.log

./start.sh
