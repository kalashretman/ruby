class Calc
  def check(a, b)

  end
  
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

n.minus 1, 'fsdfsd'
