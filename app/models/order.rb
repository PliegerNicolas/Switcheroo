class Order < ApplicationRecord
  ORDER_STATUS = %w[closed open pending]
  belongs_to :user
  belongs_to :renter, class_name: 'User', foreign_key: 'user_id'
  belongs_to :instrument
  has_many :ratings
  validates :user_id, :renter_id, :instrument_id, :status, :due_date, presence: true
  validates :status, inclusion: { in: ORDER_STATUS }
end
