def translate(str)
  words = str.split(" ")
  words.map! do |word|
    second_methods(word)
  end
  words.join(" ")
end

def second_methods(second)
  size = second.length
  if softLit?(second[0])
    second + "ay"
  elsif second[0..1]=="qu"
    second[2..(second.length - 1)] + second[0..1] + "ay"
  elsif !softLit?(second[0]) && second[1..2]=="qu"
    second[3..(second.length - 1)] + second[0..2] + "ay"
  elsif !softLit?(second[0]) && !softLit?(second[1]) && !softLit?(second[2])
    second[3..(second.length - 1)] + second[0..2] + "ay"
  elsif !softLit?(second[0]) && !softLit?(second[1])
    second[2..(second.length - 1)] + second[0] + second[1] + "ay"
  elsif !softLit?(second[0])
    second[1..(second.length - 1)] + second[0] + "ay"
  end
end

def softLit?(let)
  "aeiouy".include? let
end