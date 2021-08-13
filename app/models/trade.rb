class Trade < ApplicationRecord
  belongs_to :crypto
  belongs_to :user
 
  validates :description, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  
  
end
