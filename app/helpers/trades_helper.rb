module TradesHelper

    def crypto_count(trade)
        trade.quantity * trade.crypto.price
    end 

    def date_time(trade)
        trade.created_at.strftime("%B %d, %Y" + ' at ' + "%H:%M")
    end

    def crypto_fields(f)
        if @crypto
            f.hidden_field :crypto_id, value: @crypto.id
        end
    end
      
end
