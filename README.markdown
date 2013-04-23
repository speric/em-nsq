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

### Contributing to em-nsq
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

### Copyright

Copyright (c) 2013 Eric Farkas. See LICENSE.txt for further details.

