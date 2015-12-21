require 'spec_helper'
require 'gift_wrapper'

describe GiftWrapper do

  describe "#total_ribbon_length" do
    it "test case 1" do
      input = "2x3x4"
      parser = described_class.new(input)
      expect(parser.total_ribbon_length).to eq(34)
    end

    it "test case 2" do
      input = "1x1x10"
      parser = described_class.new(input)
      expect(parser.total_ribbon_length).to eq(14)
    end
  end

  describe "#ribbon_length" do
    it "test case 1" do
      input = "2x3x4"
      parser = described_class.new(input)
      expect(parser.ribbon_length).to eq(10)
    end
  end

  describe "#bow_length" do
    it "test case 1" do
      input = "2x3x4"
      parser = described_class.new(input)
      expect(parser.bow_length).to eq(24)
    end
  end

  describe "#square_foot" do
    it "test case 1" do
      input = "2x3x4"
      parser = described_class.new(input)
      expect(parser.square_foot).to eq(58)
    end

    it "test case 2" do
      input = "1x1x10"
      parser = described_class.new(input)
      expect(parser.square_foot).to eq(43)
    end
  end

  describe "#parsed_input" do
    specify do
      input = "1x1x10"
      parser = described_class.new(input)
      expect(parser.parsed_input).to eq({ l:1, w:1, h:10 })
    end
  end

  describe "#base_calculation" do
    specify do
      input = "1x1x10"
      parser = described_class.new(input)
      expect(parser.base_calculation).to eq(42)
    end

    specify do
      input = "2x3x4"
      parser = described_class.new(input)
      expect(parser.base_calculation).to eq(52)
    end
  end

  describe "#slack" do
    specify do
      input = "1x1x10"
      parser = described_class.new(input)
      expect(parser.slack).to eq(1)
    end

    specify do
      input = "2x3x4"
      parser = described_class.new(input)
      expect(parser.slack).to eq(6)
    end

    specify do
      input = "24x24x24"
      parser = described_class.new(input)
      expect(parser.slack).to eq(576)
    end
  end
end
