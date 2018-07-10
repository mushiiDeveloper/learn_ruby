require "time"

def measure (q = 1)
  now_time = Time.now
  q.times do
    yield
  end
  (Time.now - now_time) / q
end