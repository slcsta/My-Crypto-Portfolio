class TradesController < ApplicationController
    # I will need a before action here  

    def index
        @trades = Trade.all
    end

    def new
        @crypto = Crypto.find_by_id(params[:crypto_id])
        @trade = @crypto.trades.build 
        # @trade.build_crypto
    end

    def create
        @crypto = Crypto.find_by_id(params[:crypto_id])
        @trade = @crypto.trades.build 
        if @trade.save
            flash[:success] = "Trade successfully saved"
            #byebug
            redirect_to trade_path(@trade)
        else
            flash.now[:error] = "Trade could not be saved"
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
        params.require(:trade).permit(:crypto_id, :description, :amount, :price)
    end
end

