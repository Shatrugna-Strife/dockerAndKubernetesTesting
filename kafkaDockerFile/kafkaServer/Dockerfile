FROM openjdk:11-jre-slim-buster

RUN apt update && apt install -y wget

RUN apt install -y wget

WORKDIR /

RUN wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz

RUN tar -xf kafka_2.13-3.1.0.tgz

RUN rm -f kafka_2.13-3.1.0.tgz

WORKDIR /kafka_2.13-3.1.0

# RUN echo "listeners=PLAINTEXT://$(hostname -I):9092" >> config/server.properties

RUN sed -i 's/zookeeper.connection.timeout.ms=18000/zookeeper.connection.timeout.ms=120000/' config/server.properties

# ENV _JAVA_OPTIONS="-Djdk.tls.rejectClientInitiatedRenegotiation=true"

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod 777 /entrypoint.sh

EXPOSE 9092

ENTRYPOINT [ "/entrypoint.sh"]