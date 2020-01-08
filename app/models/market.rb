class Market < ApplicationRecord
  before_save :set_slug
  has_many :towns
  has_many :clients

  def to_param
    slug
  end

  private 
  def set_slug
    self.slug = self.name.parameterize
  end
end
