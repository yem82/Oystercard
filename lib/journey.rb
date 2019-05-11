class Journey
  attr_accessor :journey, :entry_station, :exit_station

  PENALTY_FARE = 6
  MIN_FARE = 1

  def initialize
    @journey = { entry_station: nil, exit_station: nil }
  end

  def start(station)
    @journey[:entry_station] = station
  end

  def complete?
    !!@journey[:entry_station] && !!@journey[:exit_station]
  end

  def fare
     complete? ? MIN_FARE : PENALTY_FARE
  end

  def finish(station)
    @journey[:exit_station] = station
    self
  end
end
