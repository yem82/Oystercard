require 'station'

describe Station do
  let(:station) { Station.new }
  it "creates a new station" do
    expect(station).to eq station
  end
end
