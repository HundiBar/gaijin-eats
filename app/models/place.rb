class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  validates :name, presence:true, length: { minimum: 1 }
  validates :address, presence:true, length: { minimum: 10}
  validates :latitude, numericality: true, presence:true
  validates :longitude, numericality: true, presence:true
end
