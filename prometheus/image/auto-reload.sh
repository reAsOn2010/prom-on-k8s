#!/bin/sh

while true
do
    while inotifywait -q -e close_write,delete -r /etc/prometheus;
    do
        kill -s HUP 1
    done
done
