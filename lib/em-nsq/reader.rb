module EMNSQ
  class Reader < EMNSQ::Base
    attr_accessor :max_in_flight
    
    def initialize(*args)
      super
      @call_back     = block
      @topic         = @options[:topic]
      @channel       = @options[:channel]
      @max_in_flight = @options[:max_in_flight] ||= 2500
      @long_id       = Socket.gethostname
      @short_id      = @long_id.split('.')[0]
      
      subscribe
    end
    
    def message(&block)
      @call_back = block
      run
    end
    
    def run
      @socket.write("RDY #{@max_in_flight}\n")
      loop do 
        @call_back.call @socket.recv(4096)
      end
    end
    
    private
    
    def subscribe
      @socket.write("SUB #{@topic} #{@channel} #{@short_id} #{@long_id}\n")
      @socket.write("RDY #{@max_in_flight}\n")
    end
  end
end