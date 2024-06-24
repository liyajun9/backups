#!/bin/bash

./stop.sh

mv db.py db.py_new
mv firmwarelog.py firmwarelog.py_new
mv log_route.py log_route.py_new

mv db.py_old db.py
mv firmwarelog.py_old firmwarelog.py
mv log_route.py_old log_route.py

./start.sh
