class MarketsController < ApplicationController
    def index
        @markets = Market.all
        @cryptos = Crypto.order_by_price  
    end
end
