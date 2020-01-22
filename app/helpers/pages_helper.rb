module PagesHelper
  def muxer (content, town)
    content.gsub(/\[ror_town\]/, "#{town.name}, #{town.state}")
  end 
end
