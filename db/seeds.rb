# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Market.destroy_all
# Crypto.destroy_all

#User.create(username: "Sid", email: "sid@gmail.com")

m = Market.create!(name: "Crypto Market")
m.cryptos.create!(name: "Bitcoin", symbol: "BTC", price: 45365.00)
m.cryptos.create!(name: "Etehereum", symbol: "ETH", price: 3043.90)
m.cryptos.create!(name: "Dogecoin", symbol: "DOGE", price: 0.2437390)
m.cryptos.create!(name: "Cardano", symbol: "ADA", price: 2.11)
m.cryptos.create!(name: "Binance Coin", symbol: "BNB", price: 402.75)
m.cryptos.create!(name: "Tether", symbol: "USDT", price: 1.00)
m.cryptos.create!(name: "XRP", symbol: "XRP", price: 1.27)
m.cryptos.create!(name: "USD Coin", symbol: "USDC", price: 1.00)
m.cryptos.create!(name: "Polkadot", symbol: "DOT", price: 22.13)
m.cryptos.create!(name: "Uniswap", symbol: "UNI", price: 28.81)
m.cryptos.create!(name: "Solana", symbol: "SOL", price: 47.23)
m.cryptos.create!(name: "Bitcoin Cash", symbol: "BCH", price: 682.62)
m.cryptos.create!(name: "Binance USD", symbol: "BUSD", price: 1.00)
m.cryptos.create!(name: "Litecoin", symbol: "LTC", price: 178.76)
m.cryptos.create!(name: "Chainlink", symbol: "LINK", price: 26.45)
m.cryptos.create!(name: "Etereum Classic", symbol: "ETC", price: 71.81)
m.cryptos.create!(name: "Polygon", symbol: "MATIC", price: 1.41)
m.cryptos.create!(name: "Wrapped Bitcoin", symbol: "WBTC", price: 45923.26)
m.cryptos.create!(name: "Stellar", symbol: "XLM", price: 0.37832220)
m.cryptos.create!(name: "Internet Computer", symbol: "ICP", price: 60.89)
m.save

