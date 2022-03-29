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
    
    