require 'spec_helper'
require 'santa_house_counter'

describe SantaHouseCounter do
  describe "#count_houses" do
    it "test case 1" do
      input = ">"
      parser = described_class.new(input)
      expect(parser.count_houses).to eq(2)
    end

    it "test case 2" do
      input = "^>v<"
      parser = described_class.new(input)
      expect(parser.count_houses).to eq(4)
    end

    it "test case 3" do
      input = "^v^v^v^v^v"
      parser = described_class.new(input)
      expect(parser.count_houses).to eq(2)
    end
  end
end
