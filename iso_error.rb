class IsoError < Exception

  def self.tag_the_message(the_error_message)
    "<iso-exception>#{the_error_message.to_s}</iso_exception>"
  end

end