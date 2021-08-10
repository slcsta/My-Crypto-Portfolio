class AddMarketIdToCryptos < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptos, :market_id, :integer
  end
end
