#проверка типов
class Factory
  	def check_type a, b
    	type_a = a.class
    	type_b = b.class
    	if a != b
      		raise "Переменные разных типов"
    	end
    	return type_a
  	end  
end

#выбираем необходимый класс для выполнения операции
class Performance
	def select_operation_class type
		case type
			when String
				return String_operation
			when Numeric
				return Numeric_operation
			else
				raise 'this type don\'t support'					
		end
	end
end

#superclass
class Operation
	def plus
    	raise 'Abstract method called'
  	end

  	def minus
    	raise 'Abstract method called'
  	end

  	def division
    	raise 'Abstract method called'
  	end

  	def multiply
    	raise 'Abstract method called'
  	end
end

#объявляем методы для класса Numeric
class Numeric_operation < Operation
  	def initialize(a, b, oper)
    	@a = a
    	@b = b
    	@oper = oper
  	end

  	def check_operation oper
    	case oper
	      	when oper = '+'
	        	@oper = plus
	      	when oper = '-'
	        	@oper = minus
	      	when oper = '/'
	        	raise 'this type not division'
	      	when oper = '*'
	        	raise 'this type not myltiply'
	      	else
	        	raise 'this operation don\'t support'
    	end
  	end

  	def plus a, b
    	a + b
  	end

  	def minus a, b
    	a - b
  	end

  	def division
    	a / b
  	end

  	def multiply a, b
    	a * b
  	end
end

#объявляем методы для класса String
class String_operation < Operation
  	def initialize a, b, oper
    	@a = a
    	@b = b
    	@oper = oper
  	end

  	def check_operation oper
    	case oper
	      	when oper = '+'
	        	@oper = plus a, b
	      	when oper = '-'
	        	@oper = minus a, b
	      	when oper = '/'
	        	raise 'this type not division'
	      	when oper = '*'
	        	raise 'this type not myltiply'
	      	else
	        	raise 'this operation don\'t support'
    	end
  	end

  	def plus a, b
    	a + b
  	end

  	def minus a, b
    	a - b
  	end

  	def division
    	raise 'String don\'t division'
  	end

  	def multiply a, b
    	raise 'String don\'t multiply'
  	end
end

#точка входа 
class Calculator
  	def initialize a, b, oper
  		@a = a
  		@b = b
  		@oper = oper
  	end

  	factory = Factory.new
  	rslt = factory.check_type @a, @b

	if rslt 
		prfmns = Performance.new
    	cls_oper = prfmns.select_operation_class rslt
	end

	operat = cls_oper.new @a, @b, @oper
	qw = operat.check_operation @oper
	puts qw @a, @b 
end

s = Calculator.new.class 
puts s.new 'as', 'df', "+"