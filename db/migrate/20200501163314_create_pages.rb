class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.references :town, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.json :google_town_info
      t.json :google_business_info
      t.timestamps
    end
  end
end
