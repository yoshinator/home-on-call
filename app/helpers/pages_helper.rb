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

  def header_selector(service, screen) 
    if service&.featured_image && screen == "mobile"
      mobile_large_image(service.featured_image)
    elsif service&.featured_image && screen == "desktop"
      desktop_large_image(service.featured_image)
    else
      asset_path('home_service_bathroom.jpg')
    end 
  end

  def mobile_small_image(image)
    public_image_url(200, image)
  end

  def mobile_large_image(image)
    public_image_url(300, image)
  end

  def desktop_small_image(image)
    public_image_url(400, image)
  end 

  def desktop_large_image(image)
    public_image_url(600, image)
  end

  private 
  def public_image_url(width, image)
    if image || image&.attachment
      if Rails.env.development?
            return Rails.application.routes.url_helpers.rails_representation_url(image.variant(resize_to_limit: [width,nil]).processed, only_path: true)
        else
            return image&.variant(resize_to_limit: [width,nil]).processed.service_url&.split("?")&.first
        end
      end 
  end 
end
