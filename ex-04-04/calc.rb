class Calc
  def check(a, b)
  # do check type
  end
  # do for Integer
  def plus(a, b)
    if a.integer? && b.integer?
      p a + b
    end
  end
  def minus(a, b)
    if integer? && b.integer?
      p a - b
    end
  end
  def division(a, b)
    if a.integer? && b.integer?
      p a / b
    end
  end
  def multiply(a, b)
    if a.integer? && b.integer?
      p a * b
    end
  end

end

n = Calc.new

n.plus 1,6
n.minus 1,'fsdfsd'
