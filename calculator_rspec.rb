class Calculator
  attr_reader :count

  def add (a, b)
    add_one
    a+b
  end

  def substract(a,b)
    add_one
    a-b
  end

  def multiply(a,b)
    add_one
    a*b
  end

  def divide(a,b)
    add_one
    a/b
  end

  private
  def initialize
    @count = 0
  end

  def add_one
    @count += 1
  end
end

### main

describe Calculator do
  # before :all do
  before do
    @calculator = Calculator.new
  end

  describe "#addition" do
    it "should sum 6" do
      addition = @calculator.add(4,2)
      expect(addition).to eq(6)
    end
  end

  describe "#substract" do
    it "should sum 4" do
      substract = @calculator.substract(6,2)
      expect(substract).to eq(4)
    end
  end

  describe "#multiply" do
    it "should return 12" do
      multiply = @calculator.multiply(3,4)
      expect(multiply).to eq(12)
    end
  end

  describe "#divide" do
    it "should return 12" do
      divide = @calculator.divide(48,4)
      expect(divide).to eq(12)
    end
  end

  describe "#count" do
    it "should be called 0 times" do
      expect(@calculator.count).to eq(0)
    end
  end
end
