require 'net/http'
require 'json'

class MarketsController < ApplicationController
    def index

        @markets = Market.all
        @cryptos = Crypto.search(params[:search])
        #@cryptos = Crypto.order_by_price 
        

#         @url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h'
#         @uri = URI(@url)
#         @response = Net::HTTP.get(@uri)
#         #response = Net::HTTP.get(uri)
#         @coins = JSON.parse(@response)  
#         @w_coins_array = ["btc", "eth", "doge", "bch", "ltc", "etc"]
#         @m_coins_array = [ "usdt", "xrp", "usdc", "dot", "uni", "busd", "link", "matic", "wbtc", "xlm", "icp"]
#         @s_coins_array = ["bnb", "sol", "ada"] 

#         m = Market.update(name: "Crypto Market")
#         w = Market.update(name: "Proof of Work")
#         s = Market.update(name: "Proof of Stake")

#         # take response data and loop through to get needed values
#         @coins.each do |coin|
#             @w_coins_array.each do |wc|
#                 if wc == coin["symbol"]
#                     @cryptos.update(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
#                 end
#             end

# #         @m_coins_array.each do |mc|
# #             if mc == coin["symbol"]
# #                 m.cryptos.update(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
# #             end
# #         end
    
# #         @s_coins_array.each do |sc|
# #             if sc == coin["symbol"]
# #                 s.cryptos.update(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
# #             end
# #         end
#     end 
# # w.save
# m.save
# s.save

# Coingecko api endpoint
#   https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h








        
    end
end






