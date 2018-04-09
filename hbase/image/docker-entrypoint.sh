#!/bin/bash

# wait for DNS ready, hack here
sleep 10

export HBASE_CONF_FILE=/opt/hbase/conf/hbase-site.xml
export HADOOP_USER_NAME=root
export HBASE_MANAGES_ZK=false

sed -i "s/@HDFS_PATH@/$HDFS_PATH/g" $HBASE_CONF_FILE
sed -i "s/@ZOOKEEPER_IP_LIST@/$ZOOKEEPER_SERVICE_LIST/g" $HBASE_CONF_FILE
sed -i "s/@ZOOKEEPER_PORT@/$ZOOKEEPER_PORT/g" $HBASE_CONF_FILE
sed -i "s/@ZNODE_PARENT@/$ZNODE_PARENT/g" $HBASE_CONF_FILE

help () {
    echo "Usage:"
    echo "help     print this help page"
    echo "master   start hbase master"
    echo "region   start hbase region server"
}

master () {
    /opt/hbase/bin/hbase master start
}

region () {
    /opt/hbase/bin/hbase regionserver start
}

# fix mount problems
ln -sf /mnt/hadoop/conf/* /opt/hbase/conf
ln -sf /mnt/hbase/conf/* /opt/hbase/conf
# run command
$@
