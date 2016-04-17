require_relative 'factory.rb'

class Calc

    def initialize(a, b, oper)
  	    @a = a
  	    @b = b
  	    @oper = oper
    end

    factory = Factory.new
    rslt = factory.check_type @a, @b

    def get_result a, b, oper, rslt
        Performance.new a, b, oper, rslt  
    end
    return get_result @a, @b, @oper, rslt
end 