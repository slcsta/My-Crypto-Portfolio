# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Trade.destroy_all
User.destroy_all
Crypto.destroy_all
Market.destroy_all

#User.create(username: "Sid", email: "sid@gmail.com")

require 'net/http'
require 'json'

@url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h'
@uri = URI(@url)
@response = Net::HTTP.get(@uri)
#response = Net::HTTP.get(uri)
@coins = JSON.parse(@response) 
@w_coins_array = ["btc", "eth", "doge", "bch", "ltc", "etc"]
@m_coins_array = [ "usdt", "xrp", "usdc", "dot", "uni", "busd", "link", "matic", "wbtc", "xlm", "icp"]
@s_coins_array = ["bnb", "sol", "ada"] 

m = Market.create!(name: "Crypto Market")
w = Market.create!(name: "Proof of Work")
s = Market.create!(name: "Proof of Stake")

# take response data and loop through to get needed values

@coins.each do |coin|
    @w_coins_array.each do |wc|
        if wc == coin["symbol"]
            w.cryptos.create!(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
        end
    end

    @m_coins_array.each do |mc|
        if mc == coin["symbol"]
            m.cryptos.create!(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
        end
    end
    
    @s_coins_array.each do |sc|
        if sc == coin["symbol"]
            s.cryptos.create!(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
        end
    end
end 
w.save
m.save
s.save

# Coingecko api endpoint
#   https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h


# My original hard coded/static data
# w.cryptos.create!(name: "Bitcoin", symbol: "BTC", price: 45365.00, daily_change: -1.6)
# w.cryptos.create!(name: "Etehereum", symbol: "ETH", price: 3043.90, daily_change: -0.3)
# w.cryptos.create!(name: "Dogecoin", symbol: "DOGE", price: 0.2437390, daily_change: -2.9)
# s.cryptos.create!(name: "Cardano", symbol: "ADA", price: 2.11, daily_change: 4.9)
# s.cryptos.create!(name: "Binance Coin", symbol: "BNB", price: 402.75, daily_change: 5.0)
# m.cryptos.create!(name: "Tether", symbol: "USDT", price: 1.00, daily_change: 0.1)
# m.cryptos.create!(name: "XRP", symbol: "XRP", price: 1.27, daily_change: -1.2)
# m.cryptos.create!(name: "USD Coin", symbol: "USDC", price: 1.00, daily_change: 0.2)
# m.cryptos.create!(name: "Polkadot", symbol: "DOT", price: 22.13, daily_change: -2.8)
# m.cryptos.create!(name: "Uniswap", symbol: "UNI", price: 28.81, daily_change: -2.1)
# s.cryptos.create!(name: "Solana", symbol: "SOL", price: 47.23, daily_change: 4.7)
# w.cryptos.create!(name: "Bitcoin Cash", symbol: "BCH", price: 682.62, daily_change: -2.1)
# m.cryptos.create!(name: "Binance USD", symbol: "BUSD", price: 1.00, daily_change: 0.2)
# w.cryptos.create!(name: "Litecoin", symbol: "LTC", price: 178.76, daily_change: -1.4)
# m.cryptos.create!(name: "Chainlink", symbol: "LINK", price: 26.45, daily_change: 0.1)
# w.cryptos.create!(name: "Ethereum Classic", symbol: "ETC", price: 71.81, daily_change: -1.3)
# m.cryptos.create!(name: "Polygon", symbol: "MATIC", price: 1.41, daily_change: -3.1)
# m.cryptos.create!(name: "Wrapped Bitcoin", symbol: "WBTC", price: 45923.26, daily_change: -1.6)
# m.cryptos.create!(name: "Stellar", symbol: "XLM", price: 0.37832220, daily_change: -1.1)
# m.cryptos.create!(name: "Internet Computer", symbol: "ICP", price: 60.89, daily_change: -1.7)
# m.save
# w.save
# s.save
