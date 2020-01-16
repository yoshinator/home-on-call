module MarketsHelper

  def list_of_markets
    li = ""
    Market.all.each do |m|
      li+="<li class='list-group-item list-group-item-dark'>#{link_to m.name, m}</li>" unless m.name == "Master"
    end
    sanitize(li)
  end
end
