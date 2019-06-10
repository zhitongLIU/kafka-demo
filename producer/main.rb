require "kafka"
require 'pry'

host = 'localhost'
kafka = Kafka.new(["#{host}:9092", "#{host}:9093", "#{host}:9094", "#{host}:9095"])

topic = 'test'

# Create a topic
config = { "cleanup.policy" => "compact" }
kafka.create_topic(topic, num_partitions: 2, replication_factor: 2, timeout: 30, config: config)

# Delete a topic
# kafka.delete_topic(topic)

# Describe a topic
# pp kafka.partitions_for(topic)
# pp kafka.topics

# Deliver
# kafka.deliver_message("Hello, World!", topic: topic)

# Sync producer
# producer = kafka.producer
# key = {a: 1, b: 2}.to_json.to_s
# message = {c: "aa", d: "bb"}.to_json.to_s
# headers = {"yo" => "lo"}
# producer.produce(message, key: key, headers: headers, topic: topic,  partition: 0)
# producer.deliver_messages

# async producer
# producer = kafka.async_producer(
#   delivery_threshold: 10,
#   delivery_interval: 10
# )

# begin
#   msgs = []
#   while true do
#     msg = gets.chomp
#     partition = msg.length > 5 ? 1 : 0
#     producer.produce(msg, key: 'message', topic: topic, partition: partition)
#     msgs << msg
#   end
# rescue Interrupt
#   pp "Delivered #{msgs}"
#   producer.shutdown
# rescue => e
#   pp e
# end
