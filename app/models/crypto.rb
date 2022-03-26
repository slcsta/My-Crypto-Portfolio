class Crypto < ApplicationRecord
    belongs_to :market
    has_many :trades
    has_many :users, through: :trades

    def self.order_by_price
        self.joins(:market).order("markets.name DESC").order("cryptos.price DESC")
    end

    def self.search(search)
        if search
            crypto = self.find_by(name: search)
            if crypto
                self.where("name LIKE ?", "%#{search}%")
            else
                Crypto.order_by_price
            end
        else
            Crypto.order_by_price
        end
    end


end
