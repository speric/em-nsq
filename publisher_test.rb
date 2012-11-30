require Dir.pwd + '/lib/em-nsq'

EM.synchrony do
  publisher = EMNSQ::Publisher.new(:host => "localhost", :port => "4150")
  publisher.publish(:topic => "em-ruby-nsq-test-speric", :message => "testing NOW!")
  publisher.finish
  EM.stop
end