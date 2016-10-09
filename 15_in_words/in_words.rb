

#extend the builtin class:
class Fixnum

  def in_words
    # special case:
    if 0 == self
      return "zero";
    end

    text = ""
    text += render_trillions
    text += render_billions
    text += render_millions
    text += render_thousands
    text += render_hundreds

    text.strip
  end



  private
  # ==== private methods ====
  def render_trillions
    triplet = slice(1e12);
    if 0 < triplet
      Fixnum.render_triplet( triplet)+" trillion ";
    else
      ""
    end
  end
  
  def render_billions
    triplet = slice(1e9);
    if 0 < triplet
      Fixnum.render_triplet( triplet) +" billion "
    else
      ""
    end

  end
     
  def render_millions
    triplet = slice(1e6);
    
    if 0 < triplet
      Fixnum.render_triplet( triplet) +" million "
    else
      ""
    end
  end

  def render_thousands
    triplet = slice(1e3);
    
    if 0 < triplet
      Fixnum.render_triplet( triplet) +" thousand "
    else
      ""
    end
  end

  def render_hundreds
    triplet = slice;

    Fixnum.render_triplet( triplet )
  end

  def slice( lower_bound=1, span=1e3 )
    ( (self / lower_bound) % span).to_i
  end

  def self.render_triplet( number )
    text = ""
    if 100 <= number 
      text = "#{render_digit( number /100 )} hundred "
    end
    text += render_less_than_hundred( number%100 )
  end

  def self.render_digit( num )
    case num
    when 1 then "one"
    when 2 then "two"
    when 3 then "three"
    when 4 then "four"
    when 5 then "five"
    when 6 then "six"
    when 7 then "seven"
    when 8 then "eight"
    when 9 then "nine"
    else '' end
  end
  
  def self.render_less_than_hundred( num )
    case num
    when 1..9 then render_digit(num)
    when 10 then "ten"
    when 11 then "eleven"
    when 12 then "twelve"
    when 13 then "thirteen"
    when 15 then "fifteen"
    when 18 then "eighteen"
    when 14,16,17,19 then render_digit( num%10)+"teen"
    else 
      text = render_tens(num/10*10)
      if 0 < ( num%10)
        text += " "+render_digit( num %10)
      end
      return text;
    end
  end

  def self.render_tens( num )
    case num
    when 20 then "twenty"
    when 30 then "thirty"
    when 40 then "forty"
    when 50 then "fifty"
    when 60 then "sixty"
    when 70 then "seventy"
    when 80 then "eighty"
    when 90 then "ninety"
    else ""
    end
  end

end
