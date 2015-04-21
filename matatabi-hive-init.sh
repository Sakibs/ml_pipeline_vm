#!/bin/bash

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
