class Place < ApplicationRecord
  before_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence:true, length: { minimum: 1 }
  validates :address, presence:true, length: { minimum: 10}
  validates :photo_url, presence:true
  validates_numericality_of :latitude,  presence:true
  validates :longitude,  presence:true, numericality: true
  geocoded_by :address
end
