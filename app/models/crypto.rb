class Crypto < ApplicationRecord
    belongs_to :market
    has_many :trades
    has_many :users, through: :trades
end
