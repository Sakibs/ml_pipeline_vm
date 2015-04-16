CREATE DATABASE metastore;
USE metastore;
SOURCE /usr/local/apache-hive-0.13.1-bin/scripts/metastore/upgrade/mysql/hive-schema-0.13.0.mysql.sql;
CREATE USER hiveuser@localhost IDENTIFIED BY 'hive_password';
GRANT ALL PRIVILEGES ON metastore.* TO hiveuser@localhost;
FLUSH PRIVILEGES;
