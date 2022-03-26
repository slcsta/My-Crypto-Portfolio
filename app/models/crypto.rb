class Crypto < ApplicationRecord
    belongs_to :market
    has_many :trades
    has_many :users, through: :trades

    attr_reader :name,
                :symbol,
                :price,
                :daily_change
    
    def initialize(data)
        @name = data[:name]
        @symbol = data[:symbol].upcase
        @price = data[:current_price]
        @daily_change = data[:price_change_percentage_24h]
    end

    #name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])

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
