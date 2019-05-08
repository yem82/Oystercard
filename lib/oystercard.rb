class Oystercard
  attr_accessor :in_use
  attr_reader :balance, :min_amount
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    message = "Card violation: cannot exceed £#{MAX_BALANCE}"
    raise message if amount + balance > MAX_BALANCE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def insufficient_funds?
    @balance < 1
  end

  def touch_in
    fail "Insufficient funds" if insufficient_funds?

    @in_use = true
  end

  def touch_out
   deduct(MIN_FARE)
   @in_use = false

  end

  def in_journey?
    @in_use
  end


end
