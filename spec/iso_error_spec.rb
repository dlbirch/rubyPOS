require 'rspec'
require 'iso_error'

describe IsoError do

  let(:iso_error) { IsoError.new()}

  it 'should do something' do
    expect(:iso_error).to be_truthy
  end

end