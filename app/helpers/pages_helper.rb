module PagesHelper
  # Location can be town or market. They both have name and state attributes.
  def muxer (service, town)
    content = service.content.gsub(/\[ror_town\]/, "#{town.name if town.name}, #{town.state if town.state}")
    c = content.match(/(?<link>\+(.*?)\+)/)
    if c 
      link =  c[:link]
      link.gsub!("+", "")
      link=link_to link, public_bulk_service_path(service, town)
      return content.gsub(/\+(.*?)\+/, link)
    else 
      return content
    end
  end 

  def muxer_light(content, location)
    content.gsub(/\[ror_town\]/, "#{location.name if location.name}, #{location.state if location.state}")
  end

  def header_selector(service) 
    if service
      service.featured_image.attachment ? url_for(service.featured_image) : asset_path('home_service_bathroom.jpg')
    else 
      asset_path('home_service_bathroom.jpg')
    end 
  end
end
