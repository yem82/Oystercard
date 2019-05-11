require_relative 'journey'

class Oystercard

  attr_reader :balance, :entry_station, :exit_station
  attr_accessor :journey

  MAX_BALANCE = 90
  MIN_FARE = 2

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
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

    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    @journey = {entry_station: @entry_station, exit_station: exit_station}
    @exit_station = exit_station
  end

  def history
    @journey
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
