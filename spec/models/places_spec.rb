require 'rails_helper'

RSpec.describe Place do
  it 'has a name of more than at least 1 character' do
    place = described_class.new(
      name: '',
      address: '16 kamakura Krescent, Kamakura',
      latitude: 0,
      longitude: 0,
      photo_url: "basicnextneedtoREGEXTEST"
    )
    expect(place).to_not be_valid
    place.name = "Qu"
    expect(place.name).to have_attributes(size: (be>= 1))
    expect(place).to be_valid
  end

  it 'has an address' do
    place = Place.described_class.new(
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

  it 'has a latitude value which is a valid number' do
    place = Place.described_class.new(
      name: 'Q',
      address: '16 kamakura Krescent, Kamakura',
      latitude: "",
      longitude: 1.0490,
      photo_url: "basicnextneedtoREGEXTEST"
    )

    expect(place).to be_valid
  end

  it 'has a longitude which is a valid number' do
    place = Place.new(
      name: 'Q',
      address: '16 kamakura Krescent, Kamakura',
      latitude: -1.0304,
      longitude: "",
      photo_url: "basicnextneedtoREGEXTEST"
    )
    expect(place).to be_valid
  end

end
