require 'rspec'
require 'literal_interpreter'

describe LiteralInterpreter do

  it 'should return a new instance' do
    i =
    li = LiteralInterpreter.new()
    expect(li).to be_truthy
  end

  it 'should return a new instance using the INSTANCE class method' do
    li = LiteralInterpreter.INSTANCE()
    expect(li).to be_truthy
  end

end