class CreateCryptos < ActiveRecord::Migration[6.1]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.string :description
      t.string :symbol
      t.float :value

      t.timestamps
    end
  end
end
