EventMachine-based Ruby client for bitly's NSQ
===========

Uses [em-synchrony](https://github.com/igrigorik/em-synchrony).

### Publish synchronously
```ruby
require 'em-nsq'

publisher = EMNSQ::Publisher.new("localhost", "4150")
publisher.publish(:topic => "em-nsq-test", :message => "Hello World")
publisher.finish
```
### Publish asynchronously
```ruby
require 'em-nsq'

EM.synchrony do
  publisher = EMNSQ::Publisher.new("localhost", "4150")
  publisher.publish(:topic => "em-nsq-test", :message => "Hello World")
  publisher.finish
  EM.stop
end
```

### To Do
  * Reader
  * Documentation ([TomDoc](http://tomdoc.org/))
  * Tests
  * Publish gem

### Docs
  * [NSQ: realtime distributed message processing at scale](http://word.bitly.com/post/33232969144/nsq)
  * [NSQ Protocol](https://github.com/bitly/nsq/blob/master/docs/protocol.md)
  * [NSQ Architecture Presentation](https://speakerdeck.com/snakes/nsq-nyc-golang-meetup)