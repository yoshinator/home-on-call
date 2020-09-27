class CreateZipCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :zip_codes do |t|
      t.string :zip, limit: 5
      t.string :city
      t.string :state
      t.string :county

      t.timestamps
    end
    add_index :zip_codes, :zip, unique: true
  end
end
