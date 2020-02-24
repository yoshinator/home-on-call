class Service < ApplicationRecord
  before_save :set_slug
  has_one_attached :image, dependent: :destroy
  has_one_attached :featured_image, dependent: :destroy

  belongs_to :business_type
  has_many :clients

  scope :search, -> (term) { where("title ilike ? ", "%#{term}%") }
  
  def to_param
    slug
  end

  private 
  def set_slug 
    self.slug = self.title.parameterize
  end 
end
