#!/usr/bin/env bash
# Script to run a java application for testing jmx4prometheus.

java -jar /jmx_prometheus_httpserver-0.7-jar-with-dependencies.jar "$@"
