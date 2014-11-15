require 'rspec'
require 'iso_component'

describe IsoComponent do

    before(:each) do
      @component = IsoComponent.new()
    end

    it 'Should prevent the setting of a leaf value' do
      expect {@component.set(IsoComponent.new())}.to raise_error(IsoError)
    end

    it 'Should prevent the removal of a leaf value' do
      expect{@component.unset(2)}.to raise_error(IsoError)
    end

    it 'Should get nil for get_composite' do
      expect(@component.get_composite()).to be_falsey
    end

    it 'Should prevent the get_key request' do
      expect {@component.get_key()}.to raise_error(IsoError)
    end

    it 'Should prevent the get_value request' do
      expect {@component.get_value()}.to raise_error(IsoError)
    end

    it 'Should prevent the get_bytes request' do
      expect {@component.get_bytes()}.to raise_error(IsoError)
    end

    it 'Should return a max field of zero (assuming Composite types will override this function)' do
      expect(@component.get_max_field).to equal(0)
    end

    it 'Should return an empty has table' do
      expect(@component.get_children).to eq({})
    end




end