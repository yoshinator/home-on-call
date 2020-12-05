require 'rails_helper'

RSpec.describe "market_services/show", type: :view do
  before(:each) do
    @market_service = assign(:market_service, MarketService.create!(
      :market => nil,
      :service => nil,
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
