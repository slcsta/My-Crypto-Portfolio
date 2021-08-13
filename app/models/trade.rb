class Trade < ApplicationRecord
  belongs_to :crypto
  belongs_to :user
 
  validates :description, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}
  #validates :price, presence: true - user will have to select from a given option

  
end
