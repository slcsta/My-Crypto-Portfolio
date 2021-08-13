class Trade < ApplicationRecord
  belongs_to :crypto
  belongs_to :user
 
  validates :description, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0}
  
  def self.date_time

    order()

  end
  
end
