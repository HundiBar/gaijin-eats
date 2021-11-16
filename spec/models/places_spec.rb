require 'rails_helper'

RSpec.describe Place, type: :model do
  it 'has a name of more than at least 1 character' do
    place = Place.new(
      name: '',
      address: '',
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
end
