class Place < ApplicationRecord
  has_many :comments
  geocoded_by :address
  after_validation :geocode
  validates :address, presence: true

  validate :address_is_real
  after_commit :format_address
  def address_is_real
    return true if Geocoder.search(address)&.first&.formatted_address.present?

    errors.add(:address, "Not found")
  end
  def format_address
    return if Geocoder.search(address)&.first&.formatted_address == address

    update_columns(address: Geocoder.search(address)&.first&.formatted_address)

  end

end
