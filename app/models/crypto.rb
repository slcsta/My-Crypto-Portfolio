class Crypto < ApplicationRecord
    belongs_to :market
    has_many :trades
    has_many :users, through: :trades

    #scope :order_by_price, -> {order(:price)}

    def self.order_by_price
        self.joins(:market).order("markets.name DESC").order("cryptos.price DESC")
    end

end
