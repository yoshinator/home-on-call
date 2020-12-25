class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :slug
      t.string :title
      t.text :content
      t.text :meta

      t.timestamps
    end
  end
end
