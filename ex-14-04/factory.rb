class Factory

  def check_type a, b
    type_a = a.class
    type_b = b.class
    if a != b
      raise "Переменные разных типов"
    end
  end
  
end
