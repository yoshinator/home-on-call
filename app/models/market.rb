class Market < ApplicationRecord
  before_save :set_slug
  has_many :towns
  has_many :clients

  STATES = %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)

  validates :state, presence: true, inclusion: {in: STATES}

    def add_services
    Service.all.each do |s|
      if self.name != "Master"
        ms = MarketService.new
        ms.service= s
        ms.market= self
        ms.active= true
        ms.save
      end
    end
  end

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

  def self.States 
    STATES
  end 

  private 
  def set_slug
    self.slug = self.name.parameterize
  end
end
