require 'rails_helper'

RSpec.describe "market_services/index", type: :view do
  before(:each) do
    assign(:market_services, [
      MarketService.create!(
        :market => nil,
        :service => nil,
        :active => false
      ),
      MarketService.create!(
        :market => nil,
        :service => nil,
        :active => false
      )
    ])
  end

  it "renders a list of market_services" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
