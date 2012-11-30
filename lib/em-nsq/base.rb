module EMNSQ
  class Base
    def initialize(*args)
      @options = args.extract_options!
      
      @host    = @options[:host]
      @port    = @options[:port]
      @socket  = determine_socket
      @socket.write(MAGIC_V2)
    end
    
    def finish
      @socket.close
    end
    
    private
    
    def determine_socket
      EM.reactor_running? ? EventMachine::Synchrony::TCPSocket.open(@host, @port) : TCPSocket.open(@host, @port)
    end
  end
end