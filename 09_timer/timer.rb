
include Math

class Timer

  def initialize( secs=0)
    @seconds = secs.to_f
    update
  end

  
  def seconds=( secs )
    @seconds = secs.to_f
    update
  end

  attr_reader :seconds
  attr_reader :time_string 


  def update
    @time_string = format(@seconds)
  end


  private
  def format( secs )
    hrs = (secs / 3600.0 ).floor
    mins = ((secs % 3600.0 )/60.0).floor
    secs = (secs % 60.0).floor

    return "%02d:%02d:%02d" % [hrs, mins, secs]
  end


end
