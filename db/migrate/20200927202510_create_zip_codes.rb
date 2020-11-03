class CreateZipCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :zip_codes do |t|
      t.string :zip, limit: 5
      t.references :town, null: false, foreign_key: true

      t.timestamps
    end
    add_index :zip_codes, :zip, unique: true
  end
end
