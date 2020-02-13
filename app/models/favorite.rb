class Favorite < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  validates :instrument_id, :user_id, presence: true
end
