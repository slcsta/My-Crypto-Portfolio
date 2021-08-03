class User < ApplicationRecord
  has_secure_password # methods i get w/this: authenticate: check to see if hash/salt password matches hash/salt password in database, password: lets us use password for password digest, validate: 

  #validate presence of email and uniqueness of
  #validate uniqueness of username
  validates :username, presence: true, uniqueness: true

  has_many :trades
  has_many :cryptos, through: :trades
end
