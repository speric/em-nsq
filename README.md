em-nsq
===========

EventMachine-based Ruby client for bitly's NSQ.

### Publish
```ruby
require 'em-nsq'

EM.synchrony do
  publisher = EMNSQ::Publisher.new("localhost", "4150")
  publisher.publish(:topic => "em-nsq-test", :message => "Hello World")
  EM.stop
end
```

http://word.bitly.com/post/33232969144/nsq
https://github.com/bitly/nsq/blob/master/docs/protocol.md
https://speakerdeck.com/snakes/nsq-nyc-golang-meetup