module PagesHelper
  def muxer (service, town)
    # replace [ror_town] with town name and town state
    content = service.content.gsub(/\[ror_town\]/, "#{town.name if town.name}, #{town.state if town.state}")

    content = content.gsub(/\[cta\]/, "<a href='#lead-picker' class='btn btn-primary d-block js-scroll-trigger'>Get Started For Free</a>")
    # replace items between  plus sign ++ with a link to the same page.
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
  
  # Location can be town or market. They both have name and state attributes. Used 
  # for market show page
  def muxer_light(content, location)
    content.gsub(/\[ror_town\]/, "#{location.name if location.name}, #{location.state if location.state}")
  end

  def header_selector(service) 
    if service
      service.featured_image.attachment ? service.public_featured_url : asset_path('home_service_bathroom.jpg')
    else 
      asset_path('home_service_bathroom.jpg')
    end 
  end
end
