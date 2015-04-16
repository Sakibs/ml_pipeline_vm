#!/bin/bash

source $HOME/.bashrc


echo "============= Initializing Hive Tables ===================="

# querylog
hive -S -f matatabi_script/importer/dns-querylog/schema/querylog.sql 
cd matatabi_script/importer/dns-querylog/scripts && ./cron.sh
