#!/bin/sh

. /root/.profile
export HIVE_OPTS="$HADOOP_OPTS '-XX:OnOutOfMemoryError=\"kill -9 %p\"'"
#export HADOOP_OPTS="$HADOOP_OPTS '-XX:OnOutOfMemoryError=\"kill -9 %p\"'"
export HADOOP_HEAPSIZE=2048

hive --service hiveserver 
