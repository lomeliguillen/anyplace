class Place < ApplicationRecord
  has_many :comments
  geocoded_by :address
  after_validation :geocode
  validates :address, presence: true
end
