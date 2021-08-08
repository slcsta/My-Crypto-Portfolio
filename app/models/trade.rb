class Trade < ApplicationRecord
  belongs_to :crypto
  belongs_to :user


  accepts_nested_attributes_for :crypto, reject_if: ->(attributes){ attributes['name'].blank?}
end
