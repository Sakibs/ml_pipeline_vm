#!/bin/sh

. /root/.profile

HIVE_SERVER2_THRIFT_PORT=10039 \
    hive --service hiveserver2 \
   -hiveconf hive.aux.jars.path="file:///usr/local/apache-hive-0.13.1-bin/lib/json-hive-serde-1.0.jar,file:///home/hadoop/gitwork/hadoop-pcap/hadoop-pcap-serde/target/hadoop-pcap-serde-0.2-SNAPSHOT-jar-with-dependencies.jar" \
   -hiveconf hive.security.authorization.enabled=true \
   -hiveconf hive.security.authenticator.manager=org.apache.hadoop.hive.ql.security.SessionStateUserAuthenticator \
   -hiveconf hive.security.authorization.manager=org.apache.hadoop.hive.ql.security.authorization.plugin.sqlstd.SQLStdHiveAuthorizerFactory \
   -hiveconf hive.metastore.uris=' ' \
   -hiveconf hive.server2.authentication=PAM \
   -hiveconf hive.server2.authentication.pam.services=login 
