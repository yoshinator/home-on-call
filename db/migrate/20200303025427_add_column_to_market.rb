class AddColumnToMarket < ActiveRecord::Migration[6.0]
  def change
    add_column :markets, :state, :string
  end
end
