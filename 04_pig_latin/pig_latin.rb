

def translate( text )
  result = ""
  arr = text.split(" ");
  arr.each { |w| result += translate_word( w.strip)+" " }

  result.rstrip  
end


def translate_word( word )
  vowels="aeiou"
  letter = word.chr

  # if a vowel...
  if vowels.include?(letter)
    # keep vowels
    return pigword = word+"ay"
  else
    # chop everything else
    count = word.index(/[aeiou]/);
    if( "u"==word[count] && "q"==word[count-1])
      count+=1;
    end

    phoneme = word[0,count];

    return pigword = word[count..-1]+phoneme+"ay";
  end
end
