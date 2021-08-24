class Add24HChangeToCryptos < ActiveRecord::Migration[6.1]
  def change
    add_column :cryptos, :24_h_change, :float
  end
end
