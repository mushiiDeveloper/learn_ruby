

# # this syntax reopens the class for extension, modification, etc
# Array.class_eval do

# So will this!
class Array

  def sum
    sum = 0
    self.each{ |x| sum+=x }
    return sum;
  end

  def square
    self.map{ |x| x**2 }
  end

  def square!
    self.map!{|x| x**2}
  end

end
