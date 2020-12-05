require "rails_helper"

RSpec.describe MarketServicesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/market_services").to route_to("market_services#index")
    end

    it "routes to #new" do
      expect(:get => "/market_services/new").to route_to("market_services#new")
    end

    it "routes to #show" do
      expect(:get => "/market_services/1").to route_to("market_services#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/market_services/1/edit").to route_to("market_services#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/market_services").to route_to("market_services#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/market_services/1").to route_to("market_services#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/market_services/1").to route_to("market_services#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/market_services/1").to route_to("market_services#destroy", :id => "1")
    end
  end
end
