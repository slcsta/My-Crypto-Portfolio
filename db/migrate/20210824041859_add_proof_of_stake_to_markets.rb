class AddProofOfStakeToMarkets < ActiveRecord::Migration[6.1]
    def change
      add_column :markets, :proof_of_work, :string
    end
  end
end
