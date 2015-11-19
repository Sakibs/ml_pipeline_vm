#!/bin/sh

cd `dirname $0`/../matatabi_script

# NECOMAtter submodule update
git submodule init
git submodule update

# install required packages
apt-get -y install ansible
apt-get -y install python-apt
apt-get -y install python-pycurl

# install NECOMAtter required packages from ansible-playbook
#echo start apt-get install neo4j.
#echo INFO: This task takes VERY LONG TIME. 1>&2
#ANSIBLE_HOSTS_FILE="ansible_hosts"
#printf "[default]\\nlocalhost\\n" > $ANSIBLE_HOSTS_FILE
#ansible-playbook -v -i $ANSIBLE_HOSTS_FILE NECOMAtter/ansible-playbook/neo4j-playbook.yml
#ansible-playbook -i $ANSIBLE_HOSTS_FILE NECOMAtter/ansible-playbook/NECOMAtter-playbook.yml
#rm $ANSIBLE_HOSTS_FILE

#echo start neo4j
#/var/lib/neo4j/bin/neo4j start-no-wait
#echo waiting for neo4j server started...
#sleep 10
#echo add NECOMAtter default account
#/matatabi_script/NECOMAtter/tools/user_add.py admin abcde
#echo shutdown neo4j
#/var/lib/neo4j/bin/neo4j stop

