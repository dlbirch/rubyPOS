require 'rspec'
require 'right_padder'
require 'java'
require './lib/jpos-1.9.9-SNAPSHOT.jar'

describe RightPadder do

  it 'should pad with non-space characters' do
    rp = RightPadder.new("*")
    data = "PAD_ME!"
    expect(rp.pad(data, 10)).to eq("PAD_ME!***")

    jpos_prefixer = org.jpos.iso.RightPadder.new('*'.ord)
    expect("PAD_ME!***").to eq(jpos_prefixer.pad("PAD_ME!", 10))
  end

end