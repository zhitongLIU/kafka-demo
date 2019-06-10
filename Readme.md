# kafka demo

PPT https://docs.google.com/presentation/d/1uyA5CnHTo8BvE_2RwplavJJdoVUZMrwz4d2fghutwmk/edit?usp=sharing

## Start kafka cluster
```
  docker-compose up -d
```

## Scale kafka cluster
```
  # due to limited ports 9092-9095, only 4 brokers can be scaled
  docker-compose scale kafka=4
```

## Run bash on a kafka broker
```
  docker-compose exec kafka bash
  #or
  docker exec kafka_1 bash
  #or
  docker exec kafka1 bash
```

## Run kafka with Topic Web Interface
```
  docker-compose -f full-stack.yml up -d
```

what u should see while using
```
$ docker ps
CONTAINER ID        IMAGE                                   COMMAND                  CREATED             STATUS              PORTS                                        NAMES
758246fe21d8        landoop/kafka-topics-ui:0.9.4           "/run.sh"                About an hour ago   Up About an hour    0.0.0.0:8000->8000/tcp                       kafka_kafka-topics-ui_1
a9a4726bf56f        landoop/schema-registry-ui:0.9.4        "/run.sh"                About an hour ago   Up About an hour    0.0.0.0:8001->8000/tcp                       kafka_schema-registry-ui_1
1123bd21edfd        confluentinc/cp-kafka-rest:5.2.1        "/etc/confluent/dock…"   About an hour ago   Up About an hour    0.0.0.0:8082->8082/tcp                       kafka_kafka-rest-proxy_1
3eaf357da0a4        confluentinc/cp-schema-registry:5.2.1   "/etc/confluent/dock…"   About an hour ago   Up About an hour    0.0.0.0:8081->8081/tcp                       kafka_kafka-schema-registry_1
de59505003e3        wurstmeister/kafka                      "start-kafka.sh"         About an hour ago   Up About an hour    0.0.0.0:9093->9093/tcp                       kafka_kafka2_1
9b42a3930179        wurstmeister/kafka                      "start-kafka.sh"         About an hour ago   Up About an hour    0.0.0.0:9092->9092/tcp                       kafka_kafka1_1
05d44ee2226a        wurstmeister/kafka                      "start-kafka.sh"         About an hour ago   Up About an hour    0.0.0.0:9095->9094/tcp                       kafka_kafka4_1
a461074e0409        wurstmeister/kafka                      "start-kafka.sh"         About an hour ago   Up About an hour    0.0.0.0:9094->9094/tcp                       kafka_kafka3_1
b36f5233137d        zookeeper:3.4.9                         "/docker-entrypoint.…"   About an hour ago   Up About an hour    2888/tcp, 0.0.0.0:2181->2181/tcp, 3888/tcp   kafka_zoo1_1
```
open web interface on http://localhost:8000

ps: if it doesn't work try to specify versions
```
wurstmeister/kafka:2.12-2.2.1
```

more about docker: https://docs.docker.com/compose/

## Producer & Consumer
de-comment codes to create topics then send and fetch messages

## kafka-cli
```
# in docker container
 cd /opt/kafka
```
### Create topic
```
 bin/kafka-topics.sh --create --topic test --zookeeper zookeeper:2181 --partitions 1 --replication-factor 1
```

### Describe topic
```
 bin/kafka-topics.sh --describe --topic test --zookeeper zookeeper:2181
```

### Send message
```
  bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
```

### Fetch message
```
  bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
```

more: https://kafka.apache.org/quickstart
