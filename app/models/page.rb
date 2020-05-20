class Page < ApplicationRecord
  require 'open-uri'

  has_one_attached :town_image

  # Google Data. 
  # if !page.google_town_info && !page.google_business_info || page.updated_at.advance(months: 12) < Time.now
  def self.init(service, town)
    page = self.find_or_create_by(service_id: service.id, town_id: town.id)
      if !page.google_town_info && !page.google_business_info || page.updated_at.advance(months: 12) < Time.now
        google_client = GooglePlaces::Client.new(ENV["GOOGLE_PLACES_API_KEY"])
        businesses = google_client.spots_by_query("#{service.title} near #{town.name} #{town.state}")
        spot = google_client.spots_by_query("#{town.name}, #{town.state}")[0]
        page.google_town_info = spot.json_result_object.to_json || ""
        page.google_business_info = parse_businesses(businesses).to_json || ""
        check_for_and_attach_image(spot,page,service, town)
        page.save
      end 
    page
  end



  # Gets current active client for that market and business type. 
  # There should never be more than one active client per market and business type.
  # If there is it will default to the first one found in the db.
  def self.get_client(market, service)
    Client.where(market_id: market.id, business_type_id: service.business_type.id, active: true).first || Client.first
  end 


  private 

  def self.parse_businesses(google_biz_array)
    business_hash = {businesses: []}
    google_biz_array.each do |biz|
      business_hash[:businesses].push(biz.json_result_object)
    end 
    business_hash
  end 

  def self.check_for_and_attach_image(spot, page, service, town)
    if spot.photos[0]
      image_url = spot.photos[0]&.fetch_url(300)
      image = URI.open(image_url)
      page.town_image.attach(io: image, filename: "#{service.title}-#{town.name}-#{town.state}.jpg", content_type: 'image/jpg')
    end 
    page
  end

end