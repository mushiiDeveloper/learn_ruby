
def reverser( &block )
  blocktext = yield
  words = blocktext.split(" ")
  revd = words.collect{ |w| w.reverse+' ' }

  outtext = revd.join

  # the trailing space added when reversing each word
  outtext.rstrip!

  return outtext
end


def adder( incr=1, &block )
  yield + incr
end



def repeater( reps = 1, &block )
  reps.times {
    yield
  }
end
