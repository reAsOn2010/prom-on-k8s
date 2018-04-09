FROM ${base}/java:7

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

WORKDIR /tmp
RUN wget https://github.com/prometheus/jmx_exporter/archive/parent-0.7.tar.gz && \
    tar zxvf parent-0.7.tar.gz && \
    cd jmx_exporter-parent-0.7 && \
    sed -i "s/httpredir.debian.org/mirrors.163.com/g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y maven && \
    mvn package && \
    cp jmx_prometheus_httpserver/target/jmx_prometheus_httpserver-0.7-jar-with-dependencies.jar / && \
    cd / && rm -rf /tmp/parent-0.7.tar.gz jmx_exporter-parent-0.7 && \
    apt-get remove -y maven && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache.log}/

WORKDIR /
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-h"]
