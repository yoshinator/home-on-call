module MarketsHelper

  def list_of_markets
    li = ""
    Market.all.each do |m|
      li+="<li>#{m.name}</li>" unless m.name == "Master"
    end
    sanitize(li)
  end
end
