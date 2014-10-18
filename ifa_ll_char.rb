class IfaLLChar
  attr_accessor(:interpreter, :padder, :prefixer, :length, :description, :pad)

  def initialize(interpreter, padder, prefixer)

    @interpreter = interpreter
    @padder = padder
    @prefixer = prefixer

    @length = -1
    @description = ''
    @pad = false

  end

end