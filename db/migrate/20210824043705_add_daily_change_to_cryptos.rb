class AddDailyChangeToCryptos < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptos, :daily_change, :float
  end
end
