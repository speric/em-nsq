EventMachine-based Ruby client for bitly's NSQ
===========

Uses [em-synchrony](https://github.com/igrigorik/em-synchrony).

Still very much in development mode.  This is my first attempt at using EventMachine, so pull requests are welcome.

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
  * [Building Client Libraries](https://github.com/mreiferson/nsq/blob/3c1172f152c469734b7f41875cd8ba67bc3e3d9b/docs/building_client_libraries.md)
  * [NSQ: realtime distributed message processing at scale](http://word.bitly.com/post/33232969144/nsq)
  * [NSQ Protocol](https://github.com/bitly/nsq/blob/master/docs/protocol.md)
  * [NSQ Architecture Presentation](https://speakerdeck.com/snakes/nsq-nyc-golang-meetup)
