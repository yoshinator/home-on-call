class Town < ApplicationRecord
  before_save :set_slug
  belongs_to :market
  has_many :pages, dependent: :destroy

  STATES = %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
  validates :name, presence: true 
  validates :county, presence: true 
  validates :state, presence: true, inclusion: {in: STATES}
  validates :slug, uniqueness: true

   def to_param
    slug
   end

   def self.bulk_create(towns_hash)
     town_names = towns_hash[:name].split("\r\n")
     town_names.each do |name|
      t = self.new(name: name, county: towns_hash[:county], state: towns_hash[:state], market_id: towns_hash[:market_id])
      t.save()
     end 
   end 

   def self.States 
    STATES
   end 

   private 

   def set_slug 
    self.slug = "#{self.name} #{self.state}".parameterize
   end 
end
