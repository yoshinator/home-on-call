class Service < ApplicationRecord
  before_save :set_slug

  belongs_to :business_type
  has_many :clients
  
  def to_param
    slug
  end

  private 
  def set_slug 
    self.slug = self.title.parameterize
  end 
end
