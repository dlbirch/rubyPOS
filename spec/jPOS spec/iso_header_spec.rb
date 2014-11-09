require 'rspec'
require 'iso_header'
require_relative './jpos_spec_helper'

describe IsoHeader do

  it 'should create an IsoHeader that matches a jpos BaseHeader' do
    hdr = [50, 51, 52, 53]
    iso_hdr = IsoHeader.new(header: hdr)
    jpos_iso_hdr = org.jpos.iso.header.BaseHeader.new()

    # Load the jpos header with a byte array value
    expect(jpos_iso_hdr.unpack(hdr)).to eq(4)
    jhdr = jpos_iso_hdr.pack()

    # Now compare the rubyPOS header with the jPOS header
    hdr.each_index do |i|
      expect(hdr[i]).to eq(jhdr[i])
    end
    expect(jhdr.size).to eq(hdr.size)
  end

end