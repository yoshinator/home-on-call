class Market < ApplicationRecord
  before_save :set_slug
  has_many :towns
  has_many :clients

  def to_param
    slug
  end

  def self.alll(current_user) 
    if current_user.super 
      @markets = Market.all
    else 
      @markets = Market.all.where.not(name: "Master")
    end
  end 

  private 
  def set_slug
    self.slug = self.name.parameterize
  end
end
