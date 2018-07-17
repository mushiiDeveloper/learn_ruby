require "time"

class Timer
  def initialize(seconds = 0)
    self.seconds = seconds.to_f
  end

  def seconds=(seconds)
    @seconds = seconds
  end

  def seconds
    @seconds
  end

  def time_string
    "#{padden(@seconds / 60 / 60 % 24)}:#{padden(@seconds / 60 % 60)}:#{padden(@seconds % 60)}"
  end

  def padden(number)
    '%0.2d' % number
  end
end