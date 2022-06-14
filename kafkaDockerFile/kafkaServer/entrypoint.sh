#!/bin/bash

set -e

HOST_IP=$(hostname -I)
echo ${HOST_IP}

for ip in $HOST_IP
do
    # echo "${ip}sdasf"
    echo "listeners=PLAINTEXT://${ip}:9092" >> /kafka_2.13-3.1.0/config/server.properties
    /kafka_2.13-3.1.0/bin/kafka-server-start.sh /kafka_2.13-3.1.0/config/server.properties
    break
done

echo "listeners=PLAINTEXT://${HOST_IP[0]}:9092"

# echo "listeners=PLAINTEXT://${HOST_IP[0]}:9092" >> /kafka_2.13-3.1.0/config/server.properties

# /kafka_2.13-3.1.0/bin/kafka-server-start.sh /kafka_2.13-3.1.0/config/server.properties