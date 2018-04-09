FROM java:8-jre

ENV HBASE_VERSION 1.2.3
ENV HBASE_HOME /opt/hbase

RUN mkdir -p ${HBASE_HOME} && \
curl -L https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz | tar -xz --strip=1 -C ${HBASE_HOME}

ENV OPENTSDB_VERSION 2.2.0
RUN wget --no-check-certificate https://github.com/OpenTSDB/opentsdb/releases/download/v${OPENTSDB_VERSION}/opentsdb-${OPENTSDB_VERSION}_all.deb && \
    dpkg -i opentsdb-${OPENTSDB_VERSION}_all.deb && \
    rm ./opentsdb-${OPENTSDB_VERSION}_all.deb && \
    sed -i "s/-enableassertions/-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9990 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -enableassertions/g" /usr/share/opentsdb/bin/tsdb

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD create_table.sh /usr/share/opentsdb/tools/create_table.sh
WORKDIR /usr/share/opentsdb

EXPOSE 4242
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["version"]
