export HADOOP_INSTALL=/usr/local/hadoop-2.2.0
export HADOOP_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
export MAHOUT_HOME=/usr/local/mahout-snapshot-1.0
export HIVE_HOME=/usr/local/apache-hive-0.13.1-bin/
export ANT_HOME=/usr/local/apache-ant-1.9.2 
export MAVEN_HOME=/usr/local/apache-maven-3.1.1
export PRESTO_HOME=/usr/local/presto-0.54-SNAPSHOT
export PATH=$HADOOP_INSTALL/bin:$HADOOP_INSTALL/sbin:$MAHOUT_HOME/bin:$HIVE_HOME/bin:$JAVA_HOME/bin:$ANT_HOME/bin:$MAVEN_HOME/bin:$PRESTO_HOME/bin:$HOME/bin:$PATH
export LANG=C
export HADOOP_STREAMING=$HADOOP_INSTALL/share/hadoop/tools/lib/hadoop-streaming-2.2.0.jar
export HADOOP_CMD=$HADOOP_INSTALL/bin/hadoop
export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server:$HADOOP_HOME/lib/native

export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib/native/"
export HADOOP_COMMON_LIB_NATIVE_DIR="$HADOOP_HOME/lib/native/"

PATH=/usr/local/hadoop/bin:/usr/local/hadoop/sbin:${PATH}
