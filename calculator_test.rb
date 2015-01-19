class Calculator
  def self.add (a, b)
  	a+b
  end
  def self.substract(a,b)
  	a-b
  end
  def self.multiply(a,b)
  	a*b
  end
  def self.divide(a,b)
  	a/b
  end
end

### main

def assert(expected, actual, msg = nil)
  if expected != actual
    msg ||= "Error. Expected #{expected}, encountered #{actual}"
    puts msg
  else
    puts "Ok"
  end
end

test = [
  [6,4,2,"+"],
  [12,4,3,"*"],
  [7,10,3,"-"],
  [4,8,2,"/"],
  [-6,-4,-2,"+"],
  [-12,-4,3,"*"],
  [-13,-10,3,"-"],
  [-4,-8,2,"/"],
  [-6.0000001,-4.0000001,-2,"+"],
  [-12.0,-4.0,3.0,"*"],
  [-13,-10,3,"-"],
  [-4.0,-8,2.2,"/"]

]

test.each do |result, param1, param2, operator|
  case operator
  when "+"
    assert(result,Calculator.add(param1,param2))
  when "-"
    assert(result,Calculator.substract(param1,param2))
  when "*"
    assert(result,Calculator.multiply(param1,param2))
  when "/"
    assert(result,Calculator.divide(param1,param2))
  end
end

assert(2,Calculator.add(1,2),"esto falla")