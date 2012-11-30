require Dir.pwd + '/lib/em-nsq'

EM.synchrony do
  publisher = EMNSQ::Publisher.new("localhost", "4150")
  publisher.publish(:topic => "em-ruby-nsq-test-speric", :message => 'testing 12345')
  EM.stop
end