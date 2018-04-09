#!/bin/bash

# fix mount problems
ln -sf /mnt/hadoop/conf/* ${HBASE_HOME}/conf
ln -sf /mnt/hbase/conf/* ${HBASE_HOME}/conf
ln -sf /mnt/opentsdb/conf/* /etc/opentsdb

sh tools/create_table.sh
exec bin/tsdb $@
