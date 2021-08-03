class User < ApplicationRecord
  has_secure_password

  #validate presence of email and uniqueness of
  #validate uniqueness of username
  validates :username, presence: true, uniqueness: true

  has_many :trades
  has_many :cryptos, through: :trades
end
