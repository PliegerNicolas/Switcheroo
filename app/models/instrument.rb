class Instrument < ApplicationRecord
  INSTRUMENT_STATUS = %w[rented available]
  belongs_to :user
  has_many :favorites
  has_many_attached :photos
  validates :name, :price, :status, :views, :user_id, presence: true
  validates :status, inclusion: { in: INSTRUMENT_STATUS }
  geocoded_by :address
  after_validation :geocode
  #  :latitude, :longitude,

end
