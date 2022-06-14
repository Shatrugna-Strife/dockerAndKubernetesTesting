FROM openjdk:11-jre-slim-buster

RUN apt update && apt install -y wget

RUN apt install -y wget

WORKDIR /

RUN wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz

RUN tar -xf kafka_2.13-3.1.0.tgz

RUN rm -f kafka_2.13-3.1.0.tgz

WORKDIR /kafka_2.13-3.1.0

ENTRYPOINT ["bin/zookeeper-server-start.sh","config/zookeeper.properties"]
