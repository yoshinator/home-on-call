class PagesController < ApplicationController

  # Client will return first client in db if no client found. 
  # Use first client for default emails. 
  def show
    @service = Service.find_by!(slug: params[:service_id])
    @town = Town.find_by!(slug: params[:town_id])
    @page = Page.init(@service, @town)
    @client = Page.get_client(@town.market, @service)
    @businesses = JSON.parse(@page.google_business_info)["businesses"]
    @spot = JSON.parse(@page.google_town_info)
    @lead = Lead.new()
  end 

  def service
    @service = Service.find_by!(slug: params[:service_id])
    @markets = Market.all
  end

  def market_service
    @lead = Lead.new()
    @service = Service.find_by!(slug: params[:service_id])
    @market = Market.find_by!(slug: params[:market_id])
    @client = Page.get_client(@market, @service)
  end

  def town 
    @town = Town.find_by!(slug: params[:town_id])
    @market = @town.market
    @services = Service.all
  end

  def market 
    @market = Market.find_by!(slug: params[:market_id])
    @towns = @market.towns
  end 

  def search_results
    @services = Service.search(page_params[:search])
  end 
  
  def sitemap
    redirect_to 'https://storage.googleapis.com/homeoncall.com/sitemaps/sitemap.xml.gz',format:'xml', status: 301
  end

  def redirect_emergency
    @town = Town.find_by!(slug: params[:town_id])
    @service = Service.find_by(slug: "emergency-air-conditioner-repair")
    redirect_to public_bulk_service_path (@service @town), status: :moved_permanently
  end 

  private 

  def page_params
    params.permit(:search)
  end 
  
end
