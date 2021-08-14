class TradesController < ApplicationController
    before_action :redirect_if_not_logged_in?
    before_action :find_trade, only: [:edit, :update, :destroy] 
    # I will need a before action here  

    def index
        # if nested, then list only those trades under that crypto:
        if params[:crypto_id] && crypto = Crypto.find_by_id(params[:crypto_id])
            @trades = crypto.trades

        else
            # all the trades not listed under crypto
            @trades = Trade.order_by_created_at
        end
    end

    def new
        @crypto = Crypto.find_by_id(params[:crypto_id])
        @trade = @crypto.trades.build 
    end

    def create
        #byebug
        @trade = current_user.trades.build(trade_params)
        @crypto = Crypto.find_by_id(params[:crypto_id])
        # params[:crypto_id] && @crypto = Crypto.find_by_id(params[:crypto_id])
        # @trade = Trade.new(crypto_id: params[:crypto_id])
        #byebug
        if @trade.save
            flash[:success] = "Success! Your trade is saved!"
            #byebug
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
        # rails knows it's an edit request if @trade already exists in the database
        # @trade = Trade.find_by_id(params[:id])
    end

    def update
        # @trade = Trade.find_by_id(params[:id])
        @trade.update(trade_params)
        if @trade.valid?
            redirect_to trade_path(@trade)
        else
            render :edit
        end
    end

    def destroy
        # @trade = Trade.find_by_id(params[:id])
        @trade.destroy
        redirect_to user_path(current_user)
    end


    private  

    # Only allow safe params
    def trade_params
        params.require(:trade).permit(:description, :quantity, :crypto_id)
    end

    def find_trade
        @trade = Trade.find_by_id(params[:id])
    end
end

