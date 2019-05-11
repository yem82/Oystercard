require 'journey'

describe Journey do
  let(:station) { double :station, zone: 1 }
  let(:station2) { double :station2, zone: 1 }
  let(:journey) { Journey.new }

  it "has an entry station" do
   journey.entry_station = station
   expect(journey.entry_station).to eq station
 end

  it "has a pentalty fare by default" do
   expect(journey.fare).to eq Journey::PENALTY_FARE
 end

  it 'returns a penalty fare if no entry station given' do
   !journey.complete?
   expect(journey.fare).to eq  Journey::PENALTY_FARE
 end

  it 'completed journey' do
    expect(subject).to_not be_complete
  end

  it 'returns itself when exiting a journey' do
    expect(subject.finish(station)).to eq subject
  end

  it "knows if journey is complete" do
    journey.journey = { entry_station: station, exit_station: station2 }
    expect(journey).to be_complete
  end	  
end
