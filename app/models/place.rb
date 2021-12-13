class Place < ApplicationRecord
  before_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence:true, length: { minimum: 1 }
  validates :address, presence:true, length: { minimum: 10}
  # validates :rating, presence:true
  validates :photo_url, presence:true
  validates :latitude, numericality: true, presence:true
  validates :longitude, numericality: true, presence:true
  geocoded_by :address
end
