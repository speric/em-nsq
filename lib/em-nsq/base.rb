module EMNSQ
  class Base
    def initialize(*args)
      @options = args.extract_options!
      
      @host    = @options[:host]
      @port    = @options[:port]
      @socket  = EventMachine::Synchrony::TCPSocket.open(@host, @port)
      @socket.write(MAGIC_V2)
    end
    
    def finish
      @socket.close
    end    
  end
end
