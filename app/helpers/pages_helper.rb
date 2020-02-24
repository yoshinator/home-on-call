module PagesHelper
  def muxer (content, town)
    content.gsub(/\[ror_town\]/, "#{town.name}, #{town.state}")
  end 

  def header_selector(service) 
    service.featured_image.attachment ? url_for(service.featured_image) : asset_path('home_service_bathroom.jpg')
  end
end
