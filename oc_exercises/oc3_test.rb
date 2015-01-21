require_relative 'oc3.rb'
require 'timecop'

describe Varys do
  before do
    @varys = Varys.new
  end

  context "Non dating methods" do
    it "Should reverses a list of words and return only ones which have five letters or more" do
      result = @varys.backwards_wording(["Should","reverses","a","list","of","words","and"])
      expect(result).to eq(["dluohS", "sesrever", "sdrow"])
    end
  end

  context "Not in friday" do
    before do
      Timecop.freeze(Date.new(2015,01,21))
    end
    it "Should return float numbers that are below 0" do
      result = @varys.friday_numbers([0.0,1.1,-2.2,3.3,-4.4,5.5])
      expect(result).to eq([0.0,1.1,3.3,5.5])
    end
  end

  context "When in friday" do
    before do
      Timecop.freeze(Date.new(2015,01,23))
    end
    it "Should return float numbers that are below 0" do
      result = @varys.friday_numbers([0.0,1.1,-2.2,3.3,-4.4,5.5])
      expect(result).to eq([-2.2,-4.4])
    end
  end

end
