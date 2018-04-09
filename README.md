Overview
---
在 2017 年 02 月时如何将一个支持 opentsdb 的 prometheus 监控系统部署在 k8s 上

时间比较久远，各个组件都已经过时，所以这份配置仅供参考

Components
---
* zookeeper
* hadoop-namenode
* hadoop-datanode
* hadoop-journalnode
* hadoop-nodemanager
* hadoop-resourcemanager
* hbase-master
* hbase-regionserver
* opentsdb
* prometheus (can be federated)
* altermanager
* jmx-exporter (all the java based components will have a side car of jmx-exporter)
