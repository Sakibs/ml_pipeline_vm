#!/bin/bash -xe

source $HOME/.bashrc
source /.bashrc


echo "============= Initializing Hive Tables ===================="

# querylog
hive -S -f matatabi_script/importer/dns-querylog/schema/querylog.sql 
cd matatabi_script/importer/dns-querylog/scripts && ./cron.sh

# malc0de
/matatabi_script/importer/malc0de/scripts/HiveInit.sh
/matatabi_script/importer/malc0de/scripts/cron.sh

# TwitterSearchLogger
#/matatabi_script/importer/TwitterSearchLogger/scripts/HiveInit.sh

# TwitterStreamingLoagger
#/matatabi_script/importer/TwitterStreamingWatcher/scripts/HiveInit.sh

# abuse.ch
#mkdir -p /tmp/data/palevo
#mkdir -p /tmp/data/zeus
#mkdir -p /tmp/data/skyeye
#mkdir -p /tmp/data/feodo
#cd /tmp/data
#/matatabi_script/importer/abuse.ch/scripts/abusech_tracker.py

# netflow
#/matatabi_script/importer/netflow/scripts/HiveInit.sh
#/matatabi_script/importer/netflow/scripts/put-netflow.sh 20150701

# add anonymized netflow data into hive
#hive -S -e "alter table netflow add partition (dt='20150531');"
#hive -S -e "alter table netflow add partition (dt='20150601');"
#wget http://hadoop-master.sekiya-lab.info/netflow-sschool/20150531.csv.lzo -O - | \
#hdfs dfs -put - /user/hive/warehouse/netflow/dt=20150531/20150531.csv.lzo
#wget http://hadoop-master.sekiya-lab.info/netflow-sschool/20150601.csv.lzo -O - | \
#hdfs dfs -put - /user/hive/warehouse/netflow/dt=20150601/20150601.csv.lzo

# sflow
/matatabi_script/importer/sflow/scripts/HiveInit.sh
cd /matatabi_script/importer/sflow/scripts
mkdir tmp
ln -s ../data/sflow_data_20150101.txt.gz
ruby put-sflow.rb sflow_data_20150101.txt.gz 20150101 sflow
rm -rf tmp
