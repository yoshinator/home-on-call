class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :content
      t.references :BusinessType, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
