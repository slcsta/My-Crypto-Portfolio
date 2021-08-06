class TradesController < ApplicationController
    # I will need a before action here  

    def index
        @trades = Trade.all
    end

    def new
        @trade = Trade.new
    end

    def create
        @trade = Trade.new(trade_params)

    end

    def show
    end

    def edit
    end

    def delete
    end


    private  

    # Only allow safe params
    def trade_params
        params.require(:trade).permit(:description, :amount, :price)
    end
end

