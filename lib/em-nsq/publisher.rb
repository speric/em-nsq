module EMNSQ
  class Publisher
    def initialize(host, port)
      @host   = host
      @port   = port
      @socket = determine_socket
    end
    
    def publish(*args)
      options = args.extract_options!
      topic   = options[:topic]
      message = options[:message]
      
      @socket.write(MAGIC_V2)
      buffer_to_send = ['PUB ', topic, "\n", message.length, message].pack('a*a*a*Na*') #understand this
      @socket.write(buffer_to_send)
      
      response = @socket.recv(4096)
      size, frame, nsq_response_message = response.unpack('NNa*')
      
      if response.length == size+4
        parse_response_message nsq_response_message
      elsif response.length > size+4
        raise "Unexpected PUB response - Expected size = #{size} actual size = #{response.length-4}: message=#{nsq_response_message}"
      end
    end
        
    def finish
      @socket.close
    end
    
    private
    
    def determine_socket
      if EM.reactor_running?
        @socket = EventMachine::Synchrony::TCPSocket.open(@host, @port)
      else
        @socket = TCPSocket.open(@host, @port)
      end
    end
    
    def parse_response_message(nsq_response_message)
      if ["OK", "E_INVALID", "E_BAD_TOPIC", "E_BAD_MESSAGE", "E_PUT_FAILED"].include? nsq_response_message 
        puts nsq_response_message #log this?
      else
        raise "UNKNOWN NSQ PUB RESPONSE: #{nsq_response_message}"
      end
    end
  end
end