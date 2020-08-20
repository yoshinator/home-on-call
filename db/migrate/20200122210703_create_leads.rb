class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.references :client, null: false, foreign_key: true
      t.string :f_name
      t.string :l_name
      t.string :phone
      t.string :email
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.boolean :business
      t.text :content

      t.timestamps
    end
  end
end
