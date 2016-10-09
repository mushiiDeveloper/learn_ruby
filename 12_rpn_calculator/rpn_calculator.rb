


class RPNCalculator

  def initialize
    @stack = []
  end

  def value
    @stack.last
  end

  def push( value )
    @stack.push( value.to_f)
  end

  public
  def plus
    a,b = get_operands
    @stack.push( a + b)
  end

  def minus
    a,b = get_operands
    @stack.push( b - a)
  end

  def times
    a,b = get_operands
    @stack.push( a * b )
  end

  def divide
    a,b = get_operands
    @stack.push( b / a )
  end

  def reset
    @stack = []
  end

  # this is a pointless method
  # e.g. "1 2 3 * + 4 5 - /"
  def tokens( string )
    tokens = string.split
    tokens.map!{ |x|
      if x.match("[+-/*]")
        x.to_sym
      else
        x.to_f
      end
    }

    tokens
  end

  def evaluate( expr )
    reset 
    #puts(">> evaluating: #{expr}")
    expr.split.each{ |x|
      #puts("    token: '#{x}'   value: #{self.value}    peek: #{@stack.last}")
      case x
      when "+" then plus
      when "-" then minus
      when "/" then divide
      when "*" then times
      else push( x.to_f )
      end
    }

    self.value
  end
  
  private
  def get_operands
    if @stack.length < 2
      raise IndexError, "calculator is empty"
    end

    a = @stack.pop
    b = @stack.pop
    
    return a,b
  end

end
