class Trade < ApplicationRecord
  belongs_to :crypto
  belongs_to :user
 
  validates :description, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0}

  scope :order_by_created_at, -> {order(:created_at)}
  
end



