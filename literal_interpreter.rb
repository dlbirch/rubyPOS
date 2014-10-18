require 'iso_error'

# Implements a Literal Interpreter to convert Strings into byte arrays and vice versa. No conversion is done.
class LiteralInterpreter

  # An instance of this Interpreter. Only one needed for the whole system
  def self.INSTANCE
    LiteralInterpreter.new()
  end

  def initialize()
  end

end