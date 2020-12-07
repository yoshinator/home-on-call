class CreateMarketServices < ActiveRecord::Migration[6.1]
  def change
    create_table :market_services do |t|
      t.references :market, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
