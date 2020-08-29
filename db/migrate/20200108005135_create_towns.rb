class CreateTowns < ActiveRecord::Migration[6.0]
  def change
    create_table :towns do |t|
      t.string :name
      t.string :county
      t.string :state
      t.string :slug
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end
  end
end
