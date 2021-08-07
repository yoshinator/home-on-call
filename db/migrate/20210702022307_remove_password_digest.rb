class RemovePasswordDigest < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :password_digest, :string
  end
end
