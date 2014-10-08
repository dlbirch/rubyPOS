require 'rspec'
require_relative '../ascii_prefixer.rb'

describe Ascii_Prefixer do

  let(:ap) { Ascii_Prefixer.new()}

  it 'should do something' do
    expect(:ap).to be_truthy
  end

end