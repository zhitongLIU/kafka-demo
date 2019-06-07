require "kafka"
require 'pry'

# kafka = Kafka.new(["169.254.115.215:9095", "169.254.115.215:9096"])
host = '192.168.0.216'
kafka = Kafka.new(["#{host}:9092", "#{host}:9093"])
# kafka = Kafka.new(["#{host}:9092"])
topic = 'test2'

#kafka.delete_topic(topic)
#config = { "cleanup.policy" => "compact" }
# kafka.create_topic(topic, num_partitions: 2, replication_factor: 1, timeout: 30, config: config)
pp kafka.topics

# deliver
#kafka.deliver_message("Hello, World!", topic: topic)

# sync producer
 # producer = kafka.producer
 # producer.produce(msg, topic: 'test')
 # producer.produce("#{msg}2", topic: 'test')
 # producer.deliver_messages

 # async producer
producer = kafka.async_producer(
  delivery_threshold: 10,
  delivery_interval: 10
)

begin
  msgs = []
  while true do
    msg = gets.chomp
    producer.produce(msg, key: 'message', topic: topic, partition: 1)
    # producer.produce(msg, key: 'message', topic: topic, partition: 0)
    msgs << msg
  end
rescue Interrupt
  pp "Delivered #{msgs}"
  producer.shutdown
rescue => e
pp e
end
