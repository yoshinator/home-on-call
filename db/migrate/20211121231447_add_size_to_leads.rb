class AddSizeToLeads < ActiveRecord::Migration[6.1]
  def change
    add_column :leads, :size, :string
  end
end
