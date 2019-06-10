require "kafka"
require 'pry'

host = 'localhost'
kafka = Kafka.new(["#{host}:9092", "#{host}:9093", "#{host}:9094", "#{host}:9095"])

topic = 'test'

begin
  consumer = kafka.consumer(group_id: 'group1')
  consumer.subscribe(topic)

  # consumer.seek(topic, 1, 0)
  # consumer.seek(topic, 0, 0)
  consumer.each_message do |message|
    #return if rand(1..10) < 5

    puts "topic: #{message.topic} partition: #{message.partition}, "\
         "offset: #{message.offset}, key: #{message.key}, "\
         "value: #{message.value}, headers: #{message.headers}"

    #raise 'cause here' if rand(1..10) < 5
  end
rescue Interrupt
  consumer.stop
rescue Kafka::ProcessingError => e
  pp "error #{e.offset}"
  pp "error #{e.cause}"
  #pp "error #{e.backtrace}"
end
