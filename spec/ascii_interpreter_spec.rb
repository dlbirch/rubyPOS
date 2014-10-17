require 'rspec'
require 'ascii_interpreter'

describe AsciiInterpreter do

  it 'should return a new instance' do
    ai = AsciiInterpreter.new()
    expect(ai).to be_truthy
  end

  it 'should interpret a string as an ASCII byte array' do
    ai = AsciiInterpreter.new()
    byte_array = ai.interpret("164444222233339999", 2)
    expect(byte_array.is_a?(Array)).to be_truthy
    expect(byte_array.size).to eq(16)
  end

  it 'should fail to interpret a non-ascii string' do
    ai = AsciiInterpreter.new()
    expect {ai.interpret("1644442222333ͰǙĻĩ", 2)}.to raise_error(IsoError)
  end

  it 'should interpret and deinterpret consistently' do
    test_string = "4444222233339999"
    ai = AsciiInterpreter.new()
    byte_array = []
    byte_array = ai.interpret(test_string, 0)
    expect(ai.uninterpret(byte_array[0..-1], 0, test_string.size)).to eq(test_string)
  end


end