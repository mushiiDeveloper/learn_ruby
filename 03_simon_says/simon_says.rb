def echo(text)
  text
end

def shout(text)
  text.upcase
end

def repeat(text, count=2)
  ((text + " ") * count).strip
end

def start_of_word(str, count)
  i=0
  s=""
  while i < count do
    s+=str[i]
    i+=1
  end
  s
end

def first_word(text)
  arr=text.split(" ")
  arr[0]
end

def titleize(text)
  text.capitalize!
  text = text.split(" ")
  text.each do |x|
    x.capitalize! unless ["the", "and", "over"].include? x
  end
  text.join(" ")
end