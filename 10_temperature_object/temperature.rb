class Temperature

  def initialize( options = {} )
    if options.has_key?(:c)
      @degrees_C = options[:c];
    elsif options.has_key?(:f)
      @degrees_C = Temperature.ftoc(options[:f])
    end
  end

  def setTempC( degs_C )
    @degrees_C = degs_C
  end

  def setTempF( degs_F )
    @degrees_C = Temperature.ftoc( degs_F)
  end

  def Temperature.from_celsius( deg_C )
    t = Temperature.new
    t.setTempC( deg_C)
    t
  end

  def Temperature.from_fahrenheit( deg_F )
    t = Temperature.new
    t.setTempF( deg_F)
    t
  end

  def in_celsius
    @degrees_C
  end

  def in_fahrenheit
    Temperature.ctof( @degrees_C)
  end
  
  private
  def Temperature.ftoc( fahrenheit )
    (fahrenheit - 32.0)*(5.0/9.0)
  end
  
  private
  def Temperature.ctof( celsius )
    celsius*(9.0/5.0) + 32.0
  end


end


class Celsius < Temperature
  def initialize( deg_C )
    return self.setTempC( deg_C)
  end
end

class Fahrenheit < Temperature
  def initialize( deg_F )
    return self.setTempF( deg_F)
  end
end
