class Place < ApplicationRecord
validates :name, presence:true, length: { minimum: 1 }
validates :address, presence:true, length: { minimum: 10}
end
