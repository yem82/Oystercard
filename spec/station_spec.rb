require 'station'

Station = Struct.new(:name, :zone)

describe Station.new("Aldgate", 1) do
    it { is_expected.to have_attributes(name: "Aldgate", zone: 1) }
end
