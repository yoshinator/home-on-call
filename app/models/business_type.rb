class BusinessType < ApplicationRecord
  has_many :services
  validates :faq1, presence: :true
  validates :faq2, presence: :true
  validates :faq3, presence: :true
  validates :faq4, presence: :true
  validates :faa1, presence: :true
  validates :faa2, presence: :true
  validates :faa3, presence: :true
  validates :faa4, presence: :true

  def self.alll(current_user) 
    if current_user.super 
      @business_types = BusinessType.all
    else 
      @business_Types = BusinessType.all.where.not(name: "Master")
    end
  end 
end
