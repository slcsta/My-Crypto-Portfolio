require 'net/http'
require 'json'

class CoingeckoApi
    # def initialize(crypto)
    #     @crypto = crypto
    #     @crypto_array = ["btc", "eth", "doge", "bch", "ltc", "etc""usdt", "xrp", "usdc", "dot", "uni", "busd", "link", "matic", "wbtc", "xlm", "icp", "bnb", "sol", "ada"]
    # end


    def get_crypto_data
        response = Net::HTTP.get(URI('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h'))
        crypto_data = JSON.parse(response)
            # crypto_data.each do |data|
        crypto_attrs = crypto_data.map { |data|
            {
                name: data['name'],
                symbol: data['symbol'],
                price: data['current_price'],
                created_at: Time.zone.now,
                updated_at: Time.zone.now,
                market_id: data["market.id"],
                daily_change: data['price_change_percentage_24h'],
            }
        
        }
        Crypto.upsert_all(crypto_attrs)
    end
end                
    
    # @crypto_array.each do |arr|
                #     if arr == data['symbol']
                #     update!(price: data['current_price'], daily_change: data['price_change_percentage_24h']) 
        
                        # Crypto.find_by(name: data['name']).tap do |c|
                        #     c.update!(price: data['current_price'], daily_change: data['price_change_percentage_24h']) 
                            

    #             Crypto.upsert_all(, update_only: [:price], update_only: [:daily_change])
    #             (name: data['name'], symbol: data['symbol'].upcase, price: data['current_price'], daily_change: data['price_change_percentage_24h'])
    
    # end
        
    #         @crypto_array.each do |c|
    #             if c == d["symbol"] 
    #                 @crypto.update(name: d["name"], 
    #                 symbol: d["symbol"].upcase, 
    #                 price: d["current_price"], 
    #                 daily_change: d["price_change_percentage_24h"])    
    #             end
    #         data.update(@crypto)
    #         end
    #     end

    # end
# end

#response = Net::HTTP.get(uri)
# @coins = JSON.parse(@response) 
# @w_coins_array = ["btc", "eth", "doge", "bch", "ltc", "etc"]
# @m_coins_array = [ "usdt", "xrp", "usdc", "dot", "uni", "busd", "link", "matic", "wbtc", "xlm", "icp"]
# @s_coins_array = ["bnb", "sol", "ada"] 

# m = Market.create!(name: "Crypto Market")
# w = Market.create!(name: "Proof of Work")
# s = Market.create!(name: "Proof of Stake")

# # take response data and loop through to get needed values
# @coins.each do |coin|
#     @w_coins_array.each do |wc|
#         if wc == coin["symbol"]
#             w.cryptos.create!(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
#         end
#     end

#     @m_coins_array.each do |mc|
#         if mc == coin["symbol"]
#             m.cryptos.create!(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
#         end
#     end
    
#     @s_coins_array.each do |sc|
#         if sc == coin["symbol"]
#             s.cryptos.create!(name: coin["name"], symbol: coin["symbol"].upcase, price: coin["current_price"], daily_change: coin["price_change_percentage_24h"])
#         end
#     end

# w.save
# m.save
# s.save