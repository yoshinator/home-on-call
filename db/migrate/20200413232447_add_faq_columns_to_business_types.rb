class AddFaqColumnsToBusinessTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :business_types, :faq1, :string
    add_column :business_types, :faa1, :text
    add_column :business_types, :faq2, :string
    add_column :business_types, :faa2, :text
    add_column :business_types, :faq3, :string
    add_column :business_types, :faa3, :text
    add_column :business_types, :faq4, :string
    add_column :business_types, :faa4, :text
  end
end
