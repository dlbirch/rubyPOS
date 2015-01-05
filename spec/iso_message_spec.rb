require 'rspec'
require 'iso_msg'

describe IsoMsg do

  it 'should create an IsoMessage instance' do
    msg = IsoMsg.new()
    expect(msg).to be_truthy
  end

end