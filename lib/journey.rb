class Journey
  attr_accessor :journey

  PENALTY_FARE = 6

  def initialize
    @journey = { entry_station: nil, exit_station: nil }
  end

  def complete?
    @journey[:exit_station] != nil
  end


  def fare
    PENALTY_FARE
  end


  def finish(station)
    self
  end

end
