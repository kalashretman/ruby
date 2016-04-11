class Performance
	def initialize a, b, oper, type
		@a = a
    	@b = b
    	@oper = oper
	end

	def select_operation_class
		case @type
			when String
				return String_operation
			when Numeric
				return Numeric_operation
			else
				raise 'this type don\'t support'					
		end
	end
	
	return self.select_operation_class
end