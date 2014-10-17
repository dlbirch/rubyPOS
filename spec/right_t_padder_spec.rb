require 'rspec'
require 'right_t_padder'

describe RightTPadder do

  it 'should return an instance' do
    rtp = RightTPadder.new()
    expect(rtp).to be_truthy
  end

  it 'should handle data longer than max length without throwing an exception' do
    rtp = RightTPadder.new()
    expect(rtp.pad("1234567890123456789", 10)).to eq("1234567890")
  end

  it 'should handle data that requires padding' do
    rtp = RightTPadder.new()
    expect(rtp.pad("12345678901234567890", 25)).to eq("12345678901234567890     ")
  end

  it 'should handle data that requires no padding and no truncation' do
    rtp = RightTPadder.new()
    expect(rtp.pad("12345678901234567890", 20)).to eq("12345678901234567890")
  end

end