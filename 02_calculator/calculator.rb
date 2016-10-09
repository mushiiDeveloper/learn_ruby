def add( a,b)
  sum([a,b])
end

def subtract( a,b)
  return a-b
end


def sum(arr)
  sum = 0.0; # initiliaze as a float
  arr.each { |num| sum += num.to_f }
  return sum;
end


def multiply( a,b)
  a*b
end


def power( a,b)
  a**b
end


def factorial( a )
  if a <= 1
    return 1
  else
    return a*factorial(a-1)
  end
end
 
