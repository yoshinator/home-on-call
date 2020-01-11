class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.boolean :super
      t.boolean :client_access
      t.boolean :edit_access

      t.timestamps
    end
  end
end
