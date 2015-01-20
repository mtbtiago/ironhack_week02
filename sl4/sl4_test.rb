#encoding: utf-8
require_relative 'sl4.rb'

describe SL4 do
  before do
    @sl4 = SL4.new
  end

  describe "#first_method" do
    context "when we have more positives" do
      before do
        @values = [1,2,-4,-7,3]
      end
      it "Should return only the positive ones if most are positive." do
        # If most of them are negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil."
        result = @sl4.first_method(@values)
        expect(result).to match_array([1,2,3])
      end
    end
    context "when we have more negatives" do
      before do
        @values = [1,-2,-4,-7,3]
      end
      it "Should return only the negative ones if most are negative." do
        # Otherwise (if the amount of positives and negatives is the same) return nil."
        result = @sl4.first_method(@values)
        expect(result).to match_array([-2,-4,-7])
      end
    end
    context "when we have equal positives than negatives" do
      before do
        @values = [1,-2,-4,-7,3,5]
      end
      it "Should return nil if the amount of positives and negatives is the same" do
        result = @sl4.first_method(@values)
        expect(result).to eq(nil)
      end
    end
  end

  describe "#second_method" do
    context "when we have not empty array" do
      before do
        @values = [1,2,2,4,5,7]
      end
      it "Should return an array with four values: mode, median, mean, size" do
        # If most of them are negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil."
        result = @sl4.second_method(@values)
        # expect(result).to match_array([[1,2,3,4,5,6],0,3.5,6])
        expect(result).to match_array([[2],3,3,6])
      end
    end
    context "when we have an EMPTY array" do
      before do
        @values = []
      end
      it "Should return an array with four values: mode, median, mean, size" do
        result = @sl4.second_method(@values)
        expect(result).to eq(nil)
      end
    end
  end

  describe "#third_method" do
    context "when we have a number" do
      before do
        @value = 15
      end
      it "Should return the n-th Fibonacci number." do
        # If most of them are negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil."
        result = @sl4.third_method(@value)
        expect(result).to eq(610)
      end
    end
    context "when number = 0" do
      before do
        @value = 0
      end
      it "Should return nil" do
        result = @sl4.third_method(@value)
        expect(result).to eq(nil)
      end
    end
  end
end
