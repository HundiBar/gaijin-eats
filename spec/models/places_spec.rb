require 'rails_helper'

RSpec.describe Place, type: :model do
  it 'has a name' do
    place = Place.new(
      name: '',
      address: '',
      latitude: 0,
      longitude: 0,
    )
    expect(place).to_not be_valid
  end
end
