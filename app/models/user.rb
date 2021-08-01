class User < ApplicationRecord
  has_secure_password

  has_many :trades
  has_many :cryptos, through :trades
end
