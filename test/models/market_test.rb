require 'test_helper'

class MarketTest < ActiveSupport::TestCase
  
  test "a market does not have a slug before save" do 
    market = Market.new(name: "North East New Jersey")

    assert_nil market.to_param
    market.destroy
  end 

  test "Saving a market creates a slug" do 
    market = Market.new(name: "North East New Jersey")
    market.save()

    assert_equal "north-east-new-jersey", market.to_param
    market.destroy
  end 

  test ".alll returns all markets including Master if the Admin's super attribute is set to true" do
    current_user = Admin.create(fname: "yoan", lname: "ante", password: "testing1234", super: true, client_access: true, edit_access: true)
    market1 = Market.create(name: "Master")
    market2 = Market.create(name: "North East New Jersey")
    market3 = Market.create(name: "Pinellas County FL")

    assert Market.alll(current_user).sort, [market1, market2, market3].sort
    current_user.destroy 
    market1.destroy
    market2.destroy
    market3.destroy
  end 

  test ".alll does not return Market with name=Master if the Admin's usper attribure is set to false" do 
    current_user = Admin.create(fname: "yoan", lname: "ante", password: "testing1234", super: false, client_access: true, edit_access: true)
    market1 = Market.create(name: "Master")
    market2 = Market.create(name: "North East New Jersey")
    market3 = Market.create(name: "Pinellas County FL")

    assert Market.alll(current_user).sort, [market2, market3].sort
    current_user.destroy 
    market1.destroy
    market2.destroy
    market3.destroy
  end 

end 