class Rating < ApplicationRecord
  RATING = (1..5)
  belongs_to :order
  validates :order_id, presence: true
  validates :stars, inclusion: { in: RATING }
end
