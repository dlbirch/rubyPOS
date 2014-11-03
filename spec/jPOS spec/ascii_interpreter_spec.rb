require 'rspec'
require_relative './jpos_spec_helper'

describe "Ascii Interpreter tests" do

  it 'should yield an interpretation consistent with the jPOS version' do

    jai = org.jpos.iso.AsciiInterpreter.new()
    # expect(jpos_byte_array.is_a?(Array)).to be_truthy
    # expect(jpos_byte_array.size).to eq(16)
    # expect(byte_array).to eq(jpos_byte_array)


  end


end