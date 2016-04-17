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
    p a + b
  end

  def minus a, b
    p a - b
  end

  def division
    raise 'String don\'t division'
  end

  def multiply a, b
    raise 'String don\'t multiply'
  end
end