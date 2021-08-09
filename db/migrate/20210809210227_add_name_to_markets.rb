class AddNameToMarkets < ActiveRecord::Migration[6.1]
  def change
    add_column :markets, :name, :string
  end
end
