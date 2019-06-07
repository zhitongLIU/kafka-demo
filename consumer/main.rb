require "kafka"
require 'pry'

# kafka = Kafka.new(["localhost:9092"])
host = '192.168.0.216'
kafka = Kafka.new(["#{host}:9092", "#{host}:9093"])
topic = 'test2'
# kafka = Kafka.new(["#{host}:9092"])
# kafka = Kafka.new(["169.254.115.215:9092"])
# kafka = Kafka.new(["localhost:9095", "localhost:9096"])
messages = kafka.fetch_messages(topic: topic, partition: 1)
# kafka.each_message(topic: "test", partition: 1) do |message|
pp messages
messages.each do |message|
  puts "partition: #{message.partition}, offset: #{message.offset}, key: #{message.key}, value: #{message.value}"
end

#begin
#  consumer = kafka.consumer(group_id: 'group1')
#  consumer.subscribe(topic, start_from_beginning: false, partition_key: 'partition_key')

#  consumer.each_message do |message|
#    #return if rand(1..10) < 5
#    puts "topic: #{message.topic} partition: #{message.partition}, offset: #{message.offset}, key: #{message.key}, value: #{message.value}, headers: #{message.headers}"
#    #raise 'cause here' if rand(1..10) < 5
#  end
#rescue Interrupt
#  consumer.stop
#rescue Kafka::ProcessingError => e
#  pp "error #{e.offset}"
#  pp "error #{e.cause}"
#  #pp "error #{e.backtrace}"
#end
