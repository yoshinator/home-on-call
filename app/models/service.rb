class Service < ApplicationRecord
  before_save :set_slug
  has_one_attached :image, dependent: :destroy
  has_one_attached :featured_image, dependent: :destroy
  has_many_attached :content_images, dependent: :destroy

  belongs_to :business_type
  has_many :clients
  has_many :market_services, dependent: :destroy
  has_many :markets, through: :market_services
  has_many  :pages, dependent: :destroy

  scope :search, -> (term) { where("title ilike ? ", "%#{term}%") }

  # adds all available markets to the service as active
  def add_markets
    Market.all.each do |m|
      if m.name != "Master"
        ms = MarketService.new
        ms.service= self
        ms.market= m
        ms.active= true
        ms.save
      end
    end
  end

  def inactive_markets
    markets = self.markets
    Market.all.select do |m|
      !markets.include?(m)
    end
  end
  
  def to_param
    slug
  end

  private 
  def set_slug 
    self.slug = self.title.parameterize
  end 
end
