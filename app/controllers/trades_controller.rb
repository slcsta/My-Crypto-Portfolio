class TradesController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_trade, only: [:edit, :update, :destroy]   

    def index
        if params[:crypto_id] && @crypto = Crypto.find_by_id(params[:crypto_id])
            @trades = @crypto.trades.order_by_created_at
        else
            @trades = Trade.order_by_created_at
        end
    end

    def new
        @crypto = Crypto.find_by_id(params[:crypto_id])
        @trade = @crypto.trades.build 
    end

    def create
        @trade = current_user.trades.build(trade_params)
        @crypto = Crypto.find_by_id(params[:crypto_id])
        if @trade.save
            flash[:success] = "Success! Your trade is saved!"
            redirect_to trade_path(@trade)
        else
            flash.now[:error] = "Error! Trade failed!"
            render :new
        end
    end

    def show
        if params[:crypto_id]
            @trade = Crypto.find(params[:crypto_id]).trades.find(params[:id])
        else
            @trade = Trade.find(params[:id])
        end
    end

    def edit
    end

    def update
        @trade.update(trade_params)
        if @trade.valid?
            redirect_to trade_path(@trade)
        else
            render :edit
        end
    end

    def destroy
        @trade.destroy
        redirect_to user_path(current_user)
    end


    private  
    def trade_params
        params.require(:trade).permit(:description, :quantity, :crypto_id)
    end

    def find_trade
        @trade = Trade.find_by_id(params[:id])
    end
end

