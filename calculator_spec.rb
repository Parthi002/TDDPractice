require 'calculator'

RSpec.describe Calculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calculator = Calculator.new
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself when given a single number" do
      calculator = Calculator.new
      expect(calculator.add("5")).to eq(5)
    end

    it "returns the sum of multiple numbers separated by commas" do
      calculator = Calculator.new
      expect(calculator.add("1,2,3")).to eq(6)
    end

    it "raises an error for invalid input" do
      calculator = Calculator.new
      expect { calculator.add("1,a,3") }.to raise_error(ArgumentError)
    end

    it "supports custom delimiters" do
      calculator = Calculator.new
      expect(calculator.add("//;\n1;2;3")).to eq(6)
    end

    it "raises an exception for a single negative number" do
      calculator = Calculator.new
      expect { calculator.add("-1") }.to raise_error(ArgumentError, "Negatives not allowed: -1")
    end

    it "raises an exception for multiple negative numbers" do
      calculator = Calculator.new
      expect { calculator.add("1,-2,-3,4") }.to raise_error(ArgumentError, "Negatives not allowed: -2, -3")
    end

    it "ignores numbers greater than 1000" do
      calculator = Calculator.new
      expect(calculator.add("2,1001")).to eq(2)
    end    
  end
end
