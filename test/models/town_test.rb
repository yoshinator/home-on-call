require 'test_helper'

class TownTest < ActiveSupport::TestCase
  
  test "a town does not have a slug before save" do 
    market = Market.create(name: "North East New Jersey")
    town = Town.new(name: "North Bergen", county: "Hudson", state: "NJ", market_id: market.id)

    assert_nil town.to_param
    town.destroy
    market.destroy
  end 

  test "Saving a town creates a slug" do 
    market = Market.create(name: "North East New Jersey")
    town = Town.new(name: "North Bergen", county: "Hudson", state: "NJ", market_id: market.id)
    town.save()


    assert_equal "north-bergen-nj", town.to_param
    town.destroy
    market.destroy
  end 

end 