class Oystercard
  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    message = "Card violation: cannot exceed £#{MAX_BALANCE}"
    raise message if amount + balance > MAX_BALANCE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in

  end

  def touch_out

  end

  def in_journey?
    false
  end
end
