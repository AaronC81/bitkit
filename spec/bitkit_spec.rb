# frozen_string_literal: true

RSpec.describe Bitkit do
  before :all do
    Bitkit::Representation.reset
  end

  it "has a version number" do
    expect(Bitkit::VERSION).not_to be nil
  end

  # Note: All of these tests end with `dec!`, because otherwise this interferes with RSpec's report
  # output. `after :all` doesn't fire soon enough to prevent this.
  context "number formatting" do
    it "can change base" do      
      dec!
      expect(12.to_s).to eq "12"
      expect(12.inspect).to eq "12"

      hex!
      expect(12.to_s).to eq "0xc"
      expect(12.inspect).to eq "0xc"

      bin!
      expect(12.to_s).to eq "0b1100"
      expect(12.inspect).to eq "0b1100"

      dec!
    end

    it "can toggle prefixes" do
      hex!
      prefix! false
      expect(12.to_s).to eq "c"
      prefix! true
      expect(12.to_s).to eq "0xc"

      dec!
    end

    it "can use padding" do
      hex!
      pad! 8
      expect(12.to_s).to eq "0x0000000c"

      prefix! false
      expect(12.to_s).to eq "0000000c"

      dec!
    end
  end
end
