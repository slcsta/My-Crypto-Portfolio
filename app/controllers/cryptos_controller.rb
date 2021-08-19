class CryptosController < ApplicationController

    def index
        @cryptos = Crypto.all.order_by_price 
    end

    def show
        @crypto = Crypto.find_by_id(params[:id])
    end
end
