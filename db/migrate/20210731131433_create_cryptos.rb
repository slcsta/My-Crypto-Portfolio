class CreateCryptos < ActiveRecord::Migration[6.1]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.string :description
      t.string :symbol
      t.float :price

      t.timestamps
    end
  end
end
