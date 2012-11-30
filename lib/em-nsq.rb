$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'em-synchrony'
require 'em-nsq/publisher'

module EMNSQ
  MAGIC_V2 = "  V2"  
end

class Array
  def extract_options!
    last.is_a?(::Hash) ? pop : {}
  end
end