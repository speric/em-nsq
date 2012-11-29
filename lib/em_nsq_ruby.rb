require 'em-synchrony'
require 'net/http'

module EMNSQ
  class Publisher
    
    MAGIC_V2 = "  V2"
    
    def initialize(host, port)
      @host = host
      @port = port
    end
    
    def publish(*args)
      options = args.extract_options!
      topic   = options[:topic]
      message = options[:message]
  
      EM.synchrony do
        @socket = EventMachine::Synchrony::TCPSocket.open(@host, @port)
        @socket.write(MAGIC_V2)
        buffer_to_send = ['PUB ', topic, "\n", message.length, message].pack('a*a*a*Na*') #understand this
        @socket.write(buffer_to_send)
        response = String.new @socket.recv(4096)
        size, frame, msg = response.unpack('NNa*')
        if response.length == size+4
          return parse_response_message msg
        elsif response.length > size+4
          raise "Unexpected PUB response - Expected size = #{size} actual size = #{response.length-4}: message=#{msg}"
        end
        EM.stop
      end
    end
        
    def close 
      @socket.close
    end
    
    def parse_response_message(nsq_response_message)
      if ["OK", "E_INVALID", "E_BAD_TOPIC", "E_BAD_MESSAGE", "E_PUT_FAILED"].include? nsq_response_message 
        nsq_response_message
      else
        raise "UNKNOWN NSQ PUB RESPONSE: #{nsq_response_message}"
      end
    end
  end
  
end

class Array
  def extract_options!
    last.is_a?(::Hash) ? pop : {}
  end
end

publisher = EMNSQ::Publisher.new("localhost", "4150")
publisher.publish(:topic => "em-ruby-nsq-test-speric", :message => 'testing 12345')
