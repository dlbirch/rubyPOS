require 'rspec'
require 'null_padder'

describe NullPadder do

  it 'should return a new instance' do
    np = NullPadder.new()
    expect(np).to be_truthy
  end

  before(:each) do
    @np = NullPadder.INSTANCE
  end

  it 'should return a new INSTANCE' do
    expect(@np).to be_truthy
  end

  it 'should return data unchanged' do
    expect(@np.pad("1234567890123456789", 19)).to eq("1234567890123456789")
  end

  it 'should return padded_data unchanged' do
    padded_data = "1234567890"
    expect(@np.unpad(padded_data)).to eq(padded_data)
  end

end