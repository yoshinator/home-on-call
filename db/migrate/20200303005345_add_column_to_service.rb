class AddColumnToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :meta_description, :text
  end
end
