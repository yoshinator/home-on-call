module MarketsHelper

  def list_of_markets(markets)
    li = ""
    markets.all.each do |m|
      li+="<li class=''>#{link_to m.name, public_market_path(m)}</li>" unless m.name == "Master"
    end
    sanitize(li)
  end

  def list_of_market_services(markets, service)
    li = ""
    markets.all.each do |m|
      li+="<li class=''>#{link_to m.name, public_market_service_path(m, service)}</li>" unless m.name == "Master"
    end
    sanitize(li)
  end 
end
