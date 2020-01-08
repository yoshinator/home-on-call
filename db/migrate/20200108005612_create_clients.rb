class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      t.string :company_name
      t.boolean :active
      t.references :market, null: false, foreign_key: true
      t.references :business_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
