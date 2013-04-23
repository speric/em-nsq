require Dir.pwd + '/lib/em-nsq'

EM.synchrony do
  reader = EMNSQ::Reader.new(:host => "localhost", :port => "4150", :topic => "em-ruby-nsq-test-speric", :channel => "em-nsq-evented-test2") do |msg|
    puts ">>: #{msg}"
  end
end