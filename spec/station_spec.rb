require 'station'

describe Station do
  let(:station) { Station.new "Aldgate", 1 }

  it "creates a new station" do
    expect(station).to eq station
  end

  it "station can have a name" do
    expect(station.name).to eq "Aldgate"
  end

  it "station can have a zone" do
    expect(station.zone).to eq 1
  end
end
