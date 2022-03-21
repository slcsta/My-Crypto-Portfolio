class MarketsController < ApplicationController
    def index
        require 'net/http'
        require 'json'

        @url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h'
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @coins = JSON.parse(@response)  
        @markets = Market.all
        @cryptos = Crypto.search(params[:search])
        #@cryptos = Crypto.order_by_price 
        
    end
end
