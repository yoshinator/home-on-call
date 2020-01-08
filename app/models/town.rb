class Town < ApplicationRecord
  before_save :set_slug
  belongs_to :market

  STATES = %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
  validates :name, presence: true 
  validates :county, presence: true 
  validates :state, presence: true, inclusion: {in: STATES}
  validates :slug, uniqueness: true

   def to_param
    slug
   end

   private 

   def set_slug 
    self.slug = "#{self.name} #{self.state}".parameterize
   end 
end
