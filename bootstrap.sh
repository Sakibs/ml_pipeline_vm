#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# altering the core-site configuration
sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    echo "initializing mysql"
    sudo apt-get -y purge mysql-server-5.5
    echo "mysql-server-5.5 mysql-server/root_password password password" | debconf-set-selections
    echo "mysql-server-5.5 mysql-server/root_password_again password password" | debconf-set-selections
    sudo apt-get -y install mysql-server-5.5

    sudo service mysql start && mysql -u root -ppassword < /root/mysql-hive.sql
else
    echo "mysql initialized"
fi

service ssh start
service mysql start

$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh

/etc/init.d/supervisor start
/usr/local/presto/bin/launcher start

exec airflow webserver -p 7000

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
