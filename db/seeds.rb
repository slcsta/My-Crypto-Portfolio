# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
m = Market.create(name: "Crypto Market")
m.cryptos.create(name: "Bitcoin")
m.save
# Crypto.create(name: "Etehereum", symbol: "ETH", value: 3043.90)
# Crypto.create(name: "Dogecoin", symbol: "DOGE", value: 0.2437390)

byebug