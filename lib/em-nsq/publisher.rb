module EMNSQ
  class Publisher
    def initialize(host, port)
      @host = host
      @port = port
    end
    
    def publish(*args)
      options = args.extract_options!
      topic   = options[:topic]
      message = options[:message]
      
      open_socket
      buffer_to_send = ['PUB ', topic, "\n", message.length, message].pack('a*a*a*Na*') #understand this
      @socket.write(buffer_to_send)
      
      response = String.new @socket.recv(4096)
      size, frame, nsq_response_message = response.unpack('NNa*')
      
      if response.length == size+4
        return parse_response_message nsq_response_message
      elsif response.length > size+4
        raise "Unexpected PUB response - Expected size = #{size} actual size = #{response.length-4}: message=#{nsq_response_message}"
      end
    end
        
    def finish
      @socket.close
    end
    
    private
    
      def open_socket
        @socket = EventMachine::Synchrony::TCPSocket.open(@host, @port)
        @socket.write(MAGIC_V2)
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