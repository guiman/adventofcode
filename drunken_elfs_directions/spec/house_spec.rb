require 'spec_helper'
require 'house'

describe House do
  describe "#eql?" do
    specify do
      expect(House.new(0,0).eql?(House.new(0,0))).to eq(true)
    end
  end

  describe "#==" do
    specify do
      expect(House.new(0,0) == (House.new(0,0))).to eq(true)
    end
  end
end
