class RPNCalculator
  def initialize
    @calculator = []
  end

  def push(numbers)
    @calculator.push(numbers)
  end

  def plus
    if @calculator.size < 2
      raise "calculator is empty"
    else
      @calculator << @calculator.pop + @calculator.pop
    end
  end

  def value
    @calculator[-1]
  end

  def minus
    if @calculator.size < 2
      raise "calculator is empty"
    else
      last_elements = @calculator.pop
      @calculator << @calculator.pop - last_elements
    end
  end

  def divide
    if @calculator.size < 2
      raise "calculator is empty"
    else
      last_elements = @calculator.pop.to_f
      @calculator << @calculator.pop.to_f / last_elements
    end
  end

  def times
    if @calculator.size < 2
      raise "calculator is empty"
    else
      @calculator << @calculator.pop * @calculator.pop
    end
  end

  def tokens(string)
    string = string.split(' ')
    string.map! {|s|
      (s == "+" || s == "-" || s == "*" || s == "/") ? s.to_sym : s.to_i
    }
  end

  def evaluate(string)
    tokens(string).each do |x|
      if x == :+
        self.plus
      elsif x == :-
        self.minus
      elsif x == :*
        self.times
      elsif x == :/
        self.divide
      else
        self.push(x)
      end
    end
    self.value
  end
end
