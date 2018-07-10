def reverser
  words = yield.split(" ")
  words.each do |word|
    word.reverse!
  end
  words.join(" ")
end

def adder(k=1)
  yield + k
end

def repeater(k=1)
  k.times do
    yield
  end
end