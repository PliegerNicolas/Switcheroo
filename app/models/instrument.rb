class Instrument < ApplicationRecord
  INSTRUMENT_STATUS = %w[rented available]
  belongs_to :user
  has_many :favorites
  has_many_attached :photos
  validates :name, :price, :latitude, :longitude, :status, :views, :user_id, presence: true
  validates :status, inclusion: { in: INSTRUMENT_STATUS }
end
