class CryptosController < ApplicationController

    def index
        @cryptos = Crypto.all
    end

    def show
    end


end
