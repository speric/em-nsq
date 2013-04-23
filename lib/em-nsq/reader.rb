module EMNSQ
  class Reader < EMNSQ::Base
    attr_accessor :max_in_flight
    
<<<<<<< HEAD
    def initialize(*args)
      super
=======
    def initialize(*args, &block)
      super
      @call_back     = block
>>>>>>> d9ed9149faa515319e3b58d262a74c17a1da23d7
      @topic         = @options[:topic]
      @channel       = @options[:channel]
      @max_in_flight = @options[:max_in_flight] ||= 2500
      @long_id       = Socket.gethostname
      @short_id      = @long_id.split('.')[0]
      
      subscribe
<<<<<<< HEAD
    end
    
    def message(&block)
      @call_back = block
=======
      run
>>>>>>> d9ed9149faa515319e3b58d262a74c17a1da23d7
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
<<<<<<< HEAD
      @socket.write("RDY #{@max_in_flight}\n")
=======
>>>>>>> d9ed9149faa515319e3b58d262a74c17a1da23d7
    end
  end
end