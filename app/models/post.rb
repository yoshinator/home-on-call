class Post < ApplicationRecord
  before_save :set_slug
  belongs_to :admin
  
  def to_param
    slug
  end

  private 
  def set_slug 
    self.slug = self.title.parameterize
  end 
end
