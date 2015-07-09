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
/matatabi_script/importer/TwitterSearchLogger/scripts/HiveInit.sh

# TwitterStreamingLoagger
/matatabi_script/importer/TwitterStreamingWatcher/scripts/HiveInit.sh

# abuse.ch
mkdir -p /tmp/data/palevo
mkdir -p /tmp/data/zeus
mkdir -p /tmp/data/skyeye
mkdir -p /tmp/data/feodo
cd /tmp/data
/matatabi_script/importer/abuse.ch/scripts/abusech_tracker.py

# netflow
/matatabi_script/importer/netflow/scripts/HiveInit.sh
/matatabi_script/importer/netflow/scripts/put-netflow.sh 20150701
