require 'oystercard'

describe Oystercard do

class Oystercard
  public :deduct
end

let(:card) { Oystercard.new }
let(:each) { :start_journey }
let(:entry_station){ double :station }
let(:exit_station){ double :station }
let(:journeys){{ entry_station: entry_station, exit_station: exit_station }}

  describe "initialization" do

    it "defaults to a balance of 0" do
      expect( card.balance ).to eq 0
    end
  end

  describe "#top_up" do
    it "tops up an oystercard balance" do
      expect{ card.top_up 10 }.to change{ card.balance }.by 10
    end

    it "raises an error if topping up violates card limit" do
      max_balance = Oystercard::MAX_BALANCE
      card.top_up max_balance
      message = "Card violation: cannot exceed £#{max_balance}"
      expect{ card.top_up(1) }.to raise_error(message)
    end
  end

  describe "#deduct" do
    it "deducts a specified amount" do
      card.top_up(10)
      expect{ card.deduct 2 }.to change{ card.balance }.by(-2)
    end
  end

  describe "#touch_in" do
    it "when touched in to be #in_journey?" do
      card.top_up(10)
      card.touch_in(:exit_station)
      expect(card).to be_in_journey
    end

    it "can start journey with at least minimum balance" do
      card.top_up(0.5)
      expect{ card.touch_in(:exit_station) }.to raise_error "Insufficient funds"
    end
  end

  describe "#entry_station" do
    it "commits #entry_station to memory" do
      card.top_up(10)
      card.touch_in(entry_station)
      expect(card.entry_station).to eq entry_station
    end
  end

  describe "#touch_out" do
    it "touch out with an oystercard" do
      expect(card).to respond_to(:touch_out)
    end

    it "deducts fare amount from oystercard" do
      card.deduct(Oystercard::MIN_FARE)
      expect { card.touch_out(:exit_station) }.to change{card.balance}.by(-Oystercard::MIN_FARE)
    end

    it "when touched out to not be #in_journey" do
      card.touch_out(:exit_station)
      expect(card).not_to be_in_journey
    end
  end

  describe "#history" do
    #tested using doubles
    it "stores exit station" do
      card.top_up 10
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.exit_station).to eq exit_station
    end

    it "empty history when no journey taken" do
      expect(card.history).to eq [{}]
    end

    it "stores journeys" do
      card.top_up(10)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.history).to include journeys
    end
  end

  describe "#in_journey?" do
    it "check if a card is in a journey" do
      card.top_up(10)
      card.touch_in(entry_station)
      expect(card).to be_in_journey
    end
  end
end
