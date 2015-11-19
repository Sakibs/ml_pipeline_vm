#!/bin/bash

#set -o noglob

PREST_HOME=/usr/local/presto
#$PREST_HOME/bin/presto-cli-0.100-executable.jar --server necoma07:8080 --catalog hive --schema default $*
$PREST_HOME/bin/presto-cli-executable.jar --server localhost:8080 --catalog hive --schema default $*
