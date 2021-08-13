module TradesHelper

    def crypto_count(trade)
        trade.quantity * trade.crypto.price
    end 
end
