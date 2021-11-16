require 'rails_helper'

RSpec.describe Place, type: :model do
  it 'has a name of more than at least 1 character' do
    place = Place.new(
      name: '',
      address: '16 kamakura Krescent, Kamakura',
      latitude: 0,
      longitude: 0,
    )
    expect(place).to_not be_valid
    place.name = "Q"
    expect(place).to be_valid
  end

  it 'has an address' do
    place = Place.new(
      name: 'Q',
      address: '',
      latitude: 0,
      longitude: 0,
    )
    expect(place).to_not be_valid
    place.address = "16 kamakura Krescent, Kamakura"
    expect(place).to be_valid
  end

  it 'has a latitude value which is a number' do
    place = Place.new(
      name: 'Q',
      address: '16 kamakura Krescent, Kamakura',
      latitude: "",
      longitude: 1.0490,
    )

    expect(place).to_not be_valid
    place.latitude = -1.0304
    expect(place).to be_valid
  end

  it 'has a longitude which is a number' do
    place = Place.new(
      name: 'Q',
      address: '16 kamakura Krescent, Kamakura',
      latitude: -1.0304,
      longitude: "",
    )
    expect(place).to_not be_valid
  end
end
