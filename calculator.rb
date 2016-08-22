require "rspec/autorun"

#calc = Calulator.new
#calc.add(5,10) # => 15

class Calculator
  def add(a, b)
    a + b
  end
end

describe Calculator do
  describe "#add" do  #the has is used to denote an instance method
    it "returns the sum of its two arguements" do
      calc = Calculator.new
      expect(calc.add(5,10)).to eq(15)
    end

    it "returns the sum of its two arguements" do
      calc = Calculator.new
      expect(calc.add(1,2)).to eq(3)
    end

    it "returns the sum of its two arguements" do
      calc = Calculator.new
      expect(calc.add(-5,10)).to eq(5)
    end

    it "returns the sum of its two arguements" do
      calc = Calculator.new
      expect(calc.add(-5, -8)).to eq(-13)
    end
  end
end
