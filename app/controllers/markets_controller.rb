require 'net/http'
require 'json'

class MarketsController < ApplicationController
    def index
        @markets = Market.all
        #@cryptos = CoingeckoApi.new(params[:crypto]).get_crypto_data
        @cryptos = Crypto.search(params[:search])
        @cryptos = Crypto.order_by_price 
    end
end






