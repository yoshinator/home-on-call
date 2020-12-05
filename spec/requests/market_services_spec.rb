require 'rails_helper'

RSpec.describe "MarketServices", type: :request do
  describe "GET /market_services" do
    it "works! (now write some real specs)" do
      get market_services_path
      expect(response).to have_http_status(200)
    end
  end
end
