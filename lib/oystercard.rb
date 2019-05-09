class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(amount)
    message = "Card violation: cannot exceed £#{MAX_BALANCE}"
    raise message if amount + balance > MAX_BALANCE

    @balance += amount
  end

  def insufficient_funds?
    @balance < 1
  end

  def touch_in(station)
    fail "Insufficient funds" if insufficient_funds?

    @exit_station = nil
    @entry_station = station
  end

  def touch_out(exit_station)
   deduct(MIN_FARE)
   @journeys = {entry_station: @entry_station, exit_station: exit_station}
   @entry_station = nil
   @exit_station = exit_station
  end

  def history
     @journeys = [] << @journeys
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
