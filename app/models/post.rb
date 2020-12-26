class Post < ApplicationRecord
  before_save :set_slug
  belongs_to :admin
  has_one_attached :image, dependent: :destroy
  has_one_attached :featured_image, dependent: :destroy
  has_many_attached :content_images, dependent: :destroy
  def to_param
    slug
  end

  private 
  def set_slug 
    self.slug = self.title.parameterize
  end 
end
