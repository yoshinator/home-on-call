require 'rails_helper'

RSpec.describe "market_services/edit", type: :view do
  before(:each) do
    @market_service = assign(:market_service, MarketService.create!(
      :market => nil,
      :service => nil,
      :active => false
    ))
  end

  it "renders the edit market_service form" do
    render

    assert_select "form[action=?][method=?]", market_service_path(@market_service), "post" do

      assert_select "input[name=?]", "market_service[market_id]"

      assert_select "input[name=?]", "market_service[service_id]"

      assert_select "input[name=?]", "market_service[active]"
    end
  end
end
