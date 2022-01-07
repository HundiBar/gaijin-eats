require 'rails_helper'

RSpec.describe Place, :type => :model do
  subject{described_class.new(
      name: 'Restaurant name',
      address: '16 kamakura Krescent, Kamakura',
      latitude: 0.1304,
      longitude: -1.3045,
      photo_url: "basicnextneedtoREGEXTEST"
  )}
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'has an address' do
    place = described_class.new(
      name: 'Q',
      address: '',
      latitude: 0,
      longitude: 0,
      photo_url: "basicnextneedtoREGEXTEST"
    )
    expect(place).to_not be_valid
    place.address = "16 kamakura Krescent, Kamakura"
    expect(place).to be_valid
  end

  it 'has a latitude value which long enough minimum' do
    place = described_class.new(
      name: 'Q',
      address: '16 kamakura Krescent, Kamakura',
      latitude: 0,
      longitude: 0,
      photo_url: "basicnextneedtoREGEXTEST"
    )

    expect(place).to be_valid
  end

  it 'has a longitude which is long enough minimum' do
    place = described_class.new(
      name: 'Q',
      address: '16 kamakura Krescent, Kamakura',
      latitude: 1.0304,
      longitude: 1.0304,
      photo_url: "basicnextneedtREGEXTEST"
    )
    longitude = place.longitude.to_s
    puts longitude.class
    expect(longitude).to have_attributes(size: (be>10))
  end

end
