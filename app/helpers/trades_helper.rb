module TradesHelper

    def crypto_count(trade)
        trade.quantity * trade.crypto.price
    end 

    def date_time(trade)
        trade.created_at.strftime("%B %d, %Y" + ' at ' + "%H:%M")
    end
      
end
