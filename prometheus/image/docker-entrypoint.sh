#!/bin/sh

/auto-reload.sh &

exec "/bin/prometheus" "$@"
