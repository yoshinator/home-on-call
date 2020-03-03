module PagesHelper
  # Location can be town or market. 
  def muxer (content, location)
    content.gsub(/\[ror_town\]/, "#{location.name}, #{location.state if location.state}")
  end 

  def header_selector(service) 
    service.featured_image.attachment ? url_for(service.featured_image) : asset_path('home_service_bathroom.jpg')
  end
end
