require 'rspec'
require 'right_t_padder'

describe RightTPadder do

  before(:each) do
    @rtp = RightTPadder.new()
  end

  it 'should return an instance' do
    expect(@rtp).to be_truthy
  end

  it 'should handle data longer than max length without throwing an exception' do
    expect(@rtp.pad("1234567890123456789", 10)).to eq("1234567890")
  end

  it 'should handle data that requires padding' do
    expect(@rtp.pad("12345678901234567890", 25)).to eq("12345678901234567890     ")
  end

  it 'should handle data that requires no padding and no truncation' do
    expect(@rtp.pad("12345678901234567890", 20)).to eq("12345678901234567890")
  end

end