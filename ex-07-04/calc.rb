class Calc
#  require 'factory'

  def initialize
  	@@a = 1
  	@@b = 2
  	@@oper = '+'
  end

#puts @@a, @@b, oper
  factory = Factory.new
  rslt = factory.check_type a, b

  puts "результат проверки типов для #{@@a} и #{@@b}", rslt

  if rslt == true 
    Performance.new a, b, oper, rslt  
  end
end

Calc.new
