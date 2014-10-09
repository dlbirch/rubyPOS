require 'rspec'
require 'ascii_prefixer'

describe AsciiPrefixer do

  it 'should do return a new instance even when number of digits is not specified' do
    ap = AsciiPrefixer.new()
    expect(ap).to be_truthy
    expect(ap.prefix_nbr_digits).to equal(1)
  end

  it 'should reject attempts to initialize with negative number' do
    begin
      ap = AsciiPrefixer.new(-1)
    rescue IsoError
    ensure
      expect(ap).to be_falsey
    end
  end

  it 'should reject attempts to initialize with 0' do
    begin
      ap = AsciiPrefixer.new(0)
    rescue IsoError
    ensure
      expect(ap).to be_falsey
    end
  end

  it 'should reject attempts to initialize with non-numeric' do
    begin
      ap = AsciiPrefixer.new('11a')
    rescue IsoError
    ensure
      expect(ap).to be_falsey
    end
  end

  it 'should reject attempts to initialize using an integer greater than 6' do
    begin
      ap = AsciiPrefixer.new(7)
    rescue IsoError
    ensure
      expect(ap).to be_falsey
    end
  end

  it 'should initialize using 6 as the number of digits' do
    ap = AsciiPrefixer.new(6)
    expect(ap).to be_truthy
    expect(ap.prefix_nbr_digits).to equal(6)
  end


end