require 'rails_helper'

RSpec.describe "/places", type: :request do
  let(:valid_attributes) do
    {
    'id' => '1',
    'address' => 'Test10ormore',
    'name' => '12ormore',
    'longitude' => 123.344,
    'latitude' => 124.345
    }
  end

  let(:invalid_attributes) do
    {
    'id' => 'a',
    'address' => 'less',
    'name' => '1',
    'longitude' => 'strraang',
    'latitude' => 'me2strang'
    }
  end

  describe "GET /index" do
    it 'renders a succesful response' do
      place = Place.new(valid_attributes)
      place.save
      get places_url
      expect(response).to be_successful
    end
  end
end
