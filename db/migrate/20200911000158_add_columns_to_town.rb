class AddColumnsToTown < ActiveRecord::Migration[6.1]
  def change
    add_column :towns, :town_description, :text
    add_column :towns, :service_description, :text
  end
end
