class User < ApplicationRecord
  has_secure_password # methods i get w/this: authenticate: check to see if hash/salt password matches hash/salt password in database, password: lets us use password for password digest, validate: 

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  has_many :trades
  has_many :cryptos, through: :trades
end
