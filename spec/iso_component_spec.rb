require 'rspec'
require 'iso_component'

describe IsoComponent do

  it 'Prevent the setting of a leaf value' do
    c = IsoComponent.new()
    expect {c.set(IsoComponent.new())}.to raise_error(IsoError)
  end

  it 'Prevent the removal of a leaf value' do
    expect {IsoComponent.new().unset(2)}.to raise_error(IsoError)
  end

  it 'Should get nil for get_composite' do
    expect(IsoComponent.new().get_composite()).to be_falsey
  end

end