class AddMainToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :main_content, :text
    add_column :services, :main_meta, :text
  end
end
