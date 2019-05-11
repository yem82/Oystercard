require 'journey'

describe Journey do
  let(:station) { double :station, zone: 1 }
  
  it 'completed journey' do
    expect(subject).to_not be_complete
  end

  it 'returns itself when exiting a journey' do
    expect(subject.finish(station)).to eq subject
  end

  describe '#fare' do
    it "has a pentalty fare by default" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end
end
