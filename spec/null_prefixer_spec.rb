require 'rspec'
require 'null_prefixer'

describe NullPrefixer do

  it 'should return a new instance' do
    np = NullPrefixer.new()
    expect(np).to be_truthy
  end

  it 'should return a new instance using the INSTANCE class method' do
    np = NullPrefixer.INSTANCE
    expect(np).to be_truthy
  end

  it 'should return a -1 for decode length and zero for packed length' do
    np = NullPrefixer.INSTANCE
    expect(np.decode_length([], 0)).to eq(-1)
    expect(np.get_packed_length()).to eq(0)
  end

end