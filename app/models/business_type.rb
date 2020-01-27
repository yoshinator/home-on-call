class BusinessType < ApplicationRecord
  has_many :services

  def self.alll(current_user) 
    if current_user.super 
      @business_types = BusinessType.all
    else 
      @business_Types = BusinessType.all.where.not(name: "Master")
    end
  end 
end
