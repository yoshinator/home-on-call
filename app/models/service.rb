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


  def public_image_url
    if self.image&.attachment
        if Rails.env.development?
            self.image_url = Rails.application.routes.url_helpers.rails_blob_url(self.image, only_path: true)
        else
            self.image_url = self.image&.service_url&.split("?")&.first
        end
    end
    #set a default lazily
    self.image_url ||= ActionController::Base.helpers.asset_path("home_service_bathroom_mobile.jpg")
end
  private 
  def set_slug 
    self.slug = self.title.parameterize
  end 
end
