#!/bin/sh

# wait for DNS ready, hack here
sleep 10

help () {
    echo "Usage:"
    echo "help         print this help page"
    echo "namenode     start namenode"
    echo "hanamenode   start ha namenode"
    echo "journalnode  start journalnode"
    echo "datanode     start datanode"
    echo "yarn         start yarn"
}

namenode () {
    if [ ! -f ${HDFS_NAMENODE_ROOT_DIR}/current/VERSION ]; then
        echo Formatting namenode root fs in ${HDFS_NAMENODE_ROOT_DIR}
        bin/hdfs namenode -format -nonInteractive
    fi
    bin/hdfs namenode
}

hnamenode () {
    if [ ! -f ${HDFS_NAMENODE_ROOT_DIR}/current/VERSION ]; then
        echo Formatting namenode root fs in ${HDFS_NAMENODE_ROOT_DIR}
        bin/hdfs namenode -format -nonInteractive
    fi

    if [ "${HDFS_INIT_NAMENODE}" = "true" ]; then
        echo forcing initialize shared edits...
        bin/hdfs namenode -initializeSharedEdits -nonInteractive
    else
        echo booting standby...
        bin/hdfs namenode -bootstrapStandby -nonInteractive
    fi

    bin/hdfs zkfc -formatZK -nonInteractive
    sbin/hadoop-daemon.sh --script bin/hdfs start zkfc
    bin/hdfs namenode
}

datanode () {
    bin/hdfs datanode
}

journalnode () {
    bin/hdfs journalnode
}

resourcemanager () {
    bin/yarn resourcemanager
}

nodemanager () {
  bin/yarn nodemanager
}

# fix mount problems
ln -sf /mnt/hadoop/conf/* /opt/hadoop/etc/hadoop
# run command
$@
