require 'net/http'
require 'json'

class MarketsController < ApplicationController
    def index
        @markets = Market.all
        CoingeckoApi.new(params[:crypto]).get_crypto_data
        @cryptos = Crypto.search(params[:search])
        # @crypto = Crypto.find_by_id(params[:crypto_id])
    end
end






