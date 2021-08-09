class CryptosController < ApplicationController

    def index
        @cryptos = Crypto.all
    end

    def show
        @crypto = find_by_id(params[:id])
    end
end
