FROM ${base}/prometheus:release-1.2
MAINTAINER shaolei <the.reason.sake@gmail.com>

ADD ./docker-entrypoint.sh ./auto-reload.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD        [ "-config.file=/etc/prometheus/prometheus.yml", \
             "-storage.local.path=/prometheus", \
             "-web.console.libraries=/usr/share/prometheus/console_libraries", \
             "-web.console.templates=/usr/share/prometheus/consoles" ]
