require 'rspec'
require 'right_padder'
require_relative './jpos_spec_helper'

describe RightPadder do

  it 'should pad with non-space characters' do
    rp = RightPadder.new("*")
    data = "PAD_ME!"
    expect(rp.pad(data, 10)).to eq("PAD_ME!***")

    jpos_prefixer = org.jpos.iso.RightPadder.new('*'.ord)
    expect("PAD_ME!***").to eq(jpos_prefixer.pad("PAD_ME!", 10))
  end

end