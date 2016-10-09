


class Dictionary < Hash
  
  def initialize
    super
  end

  def entries
    self
  end
    

  def add( entry )

    if entry.is_a?(String) 
      self[entry]=nil
    elsif entry.is_a?(Hash)
      entry.keys.each { |k| self[k]= entry[k] }
    else
      puts( "## type: "+dict.class.to_s)
    end
  end

  def keywords
    self.keys.sort
  end

  def find( regex )
    return_values = {};
    self.keys.each { |k|
      if k.match(regex)
        return_values[k]=self[k];
      end
    }
    return_values
  end

  def printable
    str = ""
    sorted = self.keys.sort

    sorted.each { |k|
          str += format_entry(k,self[k])
    }
    str.rstrip!  # picky, aren't we? 

    str
  end

  def format_entry( k, v )
    return "[#{k}] \"#{v}\"\n"
  end

end
