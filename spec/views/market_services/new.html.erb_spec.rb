require 'rails_helper'

RSpec.describe "market_services/new", type: :view do
  before(:each) do
    assign(:market_service, MarketService.new(
      :market => nil,
      :service => nil,
      :active => false
    ))
  end

  it "renders new market_service form" do
    render

    assert_select "form[action=?][method=?]", market_services_path, "post" do

      assert_select "input[name=?]", "market_service[market_id]"

      assert_select "input[name=?]", "market_service[service_id]"

      assert_select "input[name=?]", "market_service[active]"
    end
  end
end
