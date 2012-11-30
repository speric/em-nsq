require 'nsq'

reader = NSQ::Reader.new(:nsqd_tcp_addresses => '127.0.0.1:4150')
puts "--->"
# Subscribe to topic=test channel=simple
reader.subscribe('em-ruby-nsq-test-speric', 'em-nsq-channel-test') do |message|
  # If this block raises an exception, then the message will be requeued.
  puts "Read #{message.body}"
end
reader.run   # Doesn't return until reader.stop is called
puts 'Reader stopped'