class BusinessType < ApplicationRecord
  has_many :services

  def self.alll(current_user) 
    if current_user.super 
      @markets = Market.all
    else 
      @markets = Market.all.where.not(name: "Master")
    end
  end 
end
