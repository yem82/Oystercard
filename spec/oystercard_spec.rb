require 'oystercard'
describe Oystercard do

before(:each) { @card = Oystercard.new }
  describe "initialization" do

    it "defaults to a balance of 0" do
      expect( @card.balance ).to eq 0
    end
  end

  describe "#top_up" do
    it "tops up an oystercard balance" do
      expect{ @card.top_up 10 }.to change{ @card.balance }.by 10
    end

    it "raises an error if topping up violates card limit" do
      max_balance = Oystercard::MAX_BALANCE
      @card.top_up max_balance
      message = "Card violation: cannot exceed £#{max_balance}"
      expect{ @card.top_up(1) }.to raise_error(message)

    end
  end

end
