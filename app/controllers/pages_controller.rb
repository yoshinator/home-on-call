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
    @zips = ZipCode.where("city ilike ?", @town.name ).where(state: @town.state.upcase)
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

  def json_search
    @services = Service.search(page_params[:search])
    render json: @services[0..2]
  end
  
  def sitemap
    redirect_to 'https://storage.googleapis.com/homeoncall.com/sitemaps/sitemap.xml.gz',format:'xml', status: 301
  end

  def redirect_emergency
    redirector("emergency-air-conditioner-repair")
  end 

  def redirect_duct
    redirector("air-duct-cleaning-repair-installation")
  end 

  def redirect_heat
    redirector("home-heater-maintenance")
  end 

  def redirect_repair
    redirector("affordable-ac-repair-service")
  end

  def redirect_installation
    redirector("affordable-hvac-installation")
  end 
  
  def redirect_junk
    redirector("junk-removal")
  end

  def redirect_service
    redirect_to "/s/affordable-hvac-installation", status: :moved_permanently
  end

  def redirect_fast
    redirect_to "/s/emergency-air-conditioner-repair", status: :moved_permanently
  end

  def redirect_junk_main
    redirect_to "/s/junk-removal", status: :moved_permanently
  end


  private 

  def redirector(service) 
    @town = Town.find_by!(slug: params[:town_id])
    @service = Service.find_by(slug: service)
    redirect_to public_bulk_service_path(@service, @town), status: :moved_permanently
  end

  def page_params
    params.permit(:search)
  end 
  
end
