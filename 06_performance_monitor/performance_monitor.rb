
require "time"

def measure( reps=1, &block)
  beg_time = Time.now;
  reps.times{
    yield
  }
  end_time = Time.now;
  elapsed = (end_time - beg_time)/reps;
  #puts("times: from: #{beg_time} to: #{end_time} is: #{elapsed}")

  return elapsed;
  
end
