require 'rails_helper'

RSpec.describe Place, :type => :model do
  subject {described_class.new(
      name: 'Restaurant name',
      address: '16 kamakura Krescent, Kamakura',
      latitude: 0.1304,
      longitude: -1.3045,
      photo_url: "basicnextneedtoREGEXTEST"
  )}
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name of minimum length of 1' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid without an address of minimum length of 10' do
    subject.address = "less 10"
    subject.to_s.length
    expect(subject).to_not be_valid
  end

  it 'is not valid without a latitude value' do
    subject.latitude = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a longitude value' do
    subject.longitude = nil
    expect(subject).to_not be_valid
  end

end
