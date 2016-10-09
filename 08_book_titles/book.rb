


class Book

  # http://grammar.yourdictionary.com/capitalization/rules-for-capitalization-in-titles.html
  @@keep_lower = [ # articles
                   "the", "a", "an",
                   # conjunctions
                   "and", "but", "or", "for", "nor",
                   #prepositions
                   "on", "at", "to", "from", "by", "in", "of",
                   "over", "under"];
  
  def initialize
    @title = "" 
  end

  attr_reader :title

  # but the writer is more complex
  def title= ( new_title )
    @title = titleize( new_title );
  end



  # lifted from lesson 03:
  private 
  def titleize( text )

    
    text = text.lstrip.gsub(/[a-z]+[ ]*/){ |word| 
      if not @@keep_lower.include?( word.rstrip )
        word[0] = word[0].upcase;
      end
      word
    }
    
    # Always capitalize the first letter, regardless
    text[0] = text[0].upcase
    
    return text;
  end


end
