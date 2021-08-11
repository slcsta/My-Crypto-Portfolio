class CryptosController < ApplicationController

    def index
        @cryptos = Crypto.all
    end

    def show
        @crypto = Crypto.find_by_id(params[:id])
    end
end
