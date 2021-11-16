class Place < ApplicationRecord
validates :name, presence:true, length: { minimum: 1 }
validates :address, presence:true, length: { minimum: 10}
validates :latitude, numericality: true, presence:true
end
