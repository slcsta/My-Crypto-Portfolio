module TradesHelper

    def crypto_count(trade)
        trade.amount * trade.crypto.value
    end 
end
