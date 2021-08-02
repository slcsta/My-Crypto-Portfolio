class User < ApplicationRecord
  has_secure_password

  #validate presence of email
  #validate uniqueness of email
  validates :username, uniqueness: true, presence: true

  has_many :trades
  has_many :cryptos, through: :trades
end
