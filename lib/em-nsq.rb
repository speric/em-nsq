$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'em-synchrony'
require 'em-nsq/base'
require 'em-nsq/publisher'
require 'em-nsq/reader'

module EMNSQ
  MAGIC_V2 = "  V2"  
end

class Array
  def extract_options!
    last.is_a?(::Hash) ? pop : {}
  end
end