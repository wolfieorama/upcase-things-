require "rspec/autorun"

#calc = Calulator.new
#calc.add(5,10) # => 15

class Calculator
  def add(a, b)
    a + b
  end

  def factorial(n)
    if n == 0
      1
    else
      (1..n).reduce(:*) #a more better factorial solution not crash mem 
    end
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

  describe "#factorial" do
    it "returns one for zero" do
      calc = Calculator.new
      expect(calc.factorial(0)).to eq(1)
    end

    it "returns the product of all the integers less than itself" do
      calc = Calculator.new
      expect(calc.factorial(5)).to eq(120)
    end
  end
end
