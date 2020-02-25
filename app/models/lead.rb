class Lead < ApplicationRecord
  belongs_to :client

  def market 
    client.market
  end 

  def business_type
    client.business_type
  end

  def service 
    business_type.services.sample
  end 

end
