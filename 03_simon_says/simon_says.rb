def echo( msg)
  msg  
end


def shout( msg )
  msg.upcase
end


def repeat( msg, reps=2 )
  result = msg
  (reps-1).times{ result += " "+msg }
  result
end

def start_of_word( msg , count=1)
  msg.lstrip!
  return msg[0,count]  
end

def first_word( text )
  words = text.split
  words[0]
end

def titleize( text )
  little_words = ["the", "and", "a", "and", "over", "under", "at"];

  text = text.lstrip.gsub(/[a-z]+[ ]*/){ |word| 
    if not little_words.include?( word.rstrip )
      word[0] = word[0].upcase;
    end

    word
  }

  # Always capitalize the first letter, regardless
  text[0] = text[0].upcase

  text 
end
  
