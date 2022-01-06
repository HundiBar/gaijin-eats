class Place < ApplicationRecord
  before_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence:true, length: { minimum: 1 }
  validates :address, presence:true, length: { minimum: 10}
  validates :photo_url, presence:true
  validates :latitude,  presence:true, length: { minimum: 10 }
  validates :longitude,  presence:true, length: { minimum: 1 }
  geocoded_by :address
end
