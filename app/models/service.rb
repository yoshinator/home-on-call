class Service < ApplicationRecord
  before_save :set_slug
  has_one_attached :image, dependent: :destroy
  has_one_attached :featured_image, dependent: :destroy
  has_many_attached :content_images, dependent: :destroy

  belongs_to :business_type
  has_many :clients
  has_many  :pages, dependent: :destroy

  scope :search, -> (term) { where("title ilike ? ", "%#{term}%") }
  
  def to_param
    slug
  end

  # THESE HAVE A BAD SMELL. I SHOULD CREATE A HELPER CLASS THAT RETURNS THE APPROPRIATE URL
  def public_mobile_image_url
    if self.image&.attachment
      if Rails.env.development?
            return Rails.application.routes.url_helpers.rails_representation_url(self.image.variant(resize_to_limit: [200,nil]).processed, only_path: true)
        else
            return self.image&.variant(resize_to_limit: [250,nil]).processed.service_url&.split("?")&.first
        end
      end 
  end

  def public_mobile_featured_url
    if self.featured_image&.attachment
      if Rails.env.development?
            return Rails.application.routes.url_helpers.rails_representation_url(self.featured_image.variant(resize_to_limit: [300,nil]).processed, only_path: true)
        else
            return self.featured_image&.variant(resize: [300,nil]).processed.service_url&.split("?")&.first
        end
      end 
  end

  def public_image_url
    if self.image&.attachment
        if Rails.env.development?
          Rails.application.routes.url_helpers.rails_blob_url(self.image.variant(resize_to_limit: [500,nil]), only_path: true)
        else
          self.image&.variant(resize_to_limit: [500,nil]).service_url&.split("?")&.first
        end
    end
  end

  def public_featured_url
    if self.featured_image&.attachment
      if Rails.env.development?
            return Rails.application.routes.url_helpers.rails_blob_url(self.featured_image.varian(resize_to_limit: [600,nil]), only_path: true)
        else
            return self.featured_image&.service_url&.split("?")&.first
        end
      end 
  end 


  private 
  def set_slug 
    self.slug = self.title.parameterize
  end 
end
