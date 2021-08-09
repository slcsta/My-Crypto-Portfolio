class Trade < ApplicationRecord
  belongs_to :crypto
  belongs_to :user
  #validates_associated :cryptos
  #validates :description, presence: true (this will be private to the user's show page)
  #validates :amount presence: true, numericality {greater_than: 0, less_than: some #}
  #validates :price, presence: true - user will have to select from a given option


  #accepts_nested_attributes_for :crypto, reject_if: ->(attributes){ attributes['name'].blank?}
end
