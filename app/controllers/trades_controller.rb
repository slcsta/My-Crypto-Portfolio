class TradesController < ApplicationController
    # I will need a before action here  

    def index
        @trades = Trade.all
    end

    def new
        @trade = Trade.new
        # @trade.build_crypto
    end

    def create
        @trade = Trade.new(trade_params)
        if @trade.save
            redirect_to trade_path(@trade)
        else
            render :new
        end
    end

    def show
        @trade = Trade.find_by_id(params[:id])
    end

    def edit
        # rails knows it's an edit request if @trade already exists in the database
        @trade = Trade.find_by_id(params[:id])

    end

    def update
        @trade = Trade.find_by_id(params[:id])
        @trade.update(trade_params)
        if @trade.valid?
            redirect_to trade_path(@trade)
        else
            render :edit
        end
    end

    def destroy
        @trade = Trade.find_by_id(params[:id])
        @trade.destroy
        redirect_to trade_path(@trade)
    end


    private  

    # Only allow safe params
    def trade_params
        params.require(:trade).permit(:description, :amount, :price)
    end
end

