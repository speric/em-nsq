EventMachine-based Ruby client for bitly's NSQ
===========

Uses [em-synchrony](https://github.com/igrigorik/em-synchrony).

`em-nsq` will detect if it's running inside an EventMachine reactor loop and choose the approriate `TCPSocket` object.  This is transparent to the client programmer. 

### Publish messages synchronously
```ruby
require 'em-nsq'

publisher = EMNSQ::Publisher.new(:host => "localhost", :port => "4150")
publisher.publish(:topic => "em-nsq-test", :message => "Hello World")
publisher.finish
```
### Publish messages asynchronously
```ruby
require 'em-nsq'

EM.synchrony do
  publisher = EMNSQ::Publisher.new(:host => "localhost", :port => "4150")
  publisher.publish(:topic => "em-nsq-test", :message => "Hello World")
  publisher.finish
  EM.stop
end
```
### Process messages asynchronously
```ruby
require 'em-nsq'

```
### To Do
  * Reader
  * Validate topic/channel names
  * Handle NSQ error responses
  * Log
  * Documentation ([TomDoc](http://tomdoc.org/))
  * Tests
  * Publish gem

### Docs
  * [NSQ: realtime distributed message processing at scale](http://word.bitly.com/post/33232969144/nsq)
  * [NSQ Protocol](https://github.com/bitly/nsq/blob/master/docs/protocol.md)
  * [NSQ Architecture Presentation](https://speakerdeck.com/snakes/nsq-nyc-golang-meetup)
