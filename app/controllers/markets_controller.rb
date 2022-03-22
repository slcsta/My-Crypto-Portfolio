class MarketsController < ApplicationController
    def index
        @markets = Market.all
        @cryptos = Crypto.search(params[:search])
        #@cryptos = Crypto.order_by_price 
        
    end
end
