require 'journey'

describe Journey do

  it 'completed journey' do
    expect(subject).to be_complete
  end

  describe '#fare' do

    it "has a pentalty fare by default" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end


  end

end
