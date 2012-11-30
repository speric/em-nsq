EventMachine-based Ruby client for bitly's NSQ.
===========

Uses [em-synchrony](https://github.com/igrigorik/em-synchrony).

### Publish
```ruby
require 'em-nsq'

EM.synchrony do
  publisher = EMNSQ::Publisher.new("localhost", "4150")
  publisher.publish(:topic => "em-nsq-test", :message => "Hello World")
  EM.stop
end
```
### Docs
  * [NSQ: realtime distributed message processing at scale](http://word.bitly.com/post/33232969144/nsq)
  * [NSQ Protocol](https://github.com/bitly/nsq/blob/master/docs/protocol.md)
  * [NSQ Architecture Presentation](https://speakerdeck.com/snakes/nsq-nyc-golang-meetup)
