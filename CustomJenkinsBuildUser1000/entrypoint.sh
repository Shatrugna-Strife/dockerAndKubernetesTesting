#!/bin/bash

set -e

if [[ -z "$WORK_DIR" ]]; then
    WORK_DIR="/workspace"
fi

mkdir -p $WORK_DIR

if [[ -z "$PASSWORD" ]]; then
    PASSWORD="admin"
fi



mkdir -p ~/.config/code-server/

echo "bind-addr: 0.0.0.0:9091
auth: password
password: ${PASSWORD}
cert: false" > ~/.config/code-server/config.yaml

code-server --user-data-dir /var/lib/code-server $WORK_DIR &

sleep infinity