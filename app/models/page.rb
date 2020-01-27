class Page
  include ActiveModel::Model

  # Gets current active client for that market and business type. 
  # There should never be more than one active client per market and business type.
  # If there is it will default to the first one found in the db.
  def self.get_client(market, service)
    Client.where(market_id: market.id, business_type_id: service.business_type.id, active: true).first || Client.first
  end 
end