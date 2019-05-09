class Oystercard

  attr_reader :balance, :min_amount, :entry_station

  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
    @entry_station = nil
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

  def touch_out
   deduct(MIN_FARE)
   @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
