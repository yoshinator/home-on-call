class PagesController < ApplicationController

  # Client will return first client in db if no client found. 
  # Use first client for default emails. 
  def show
    @service = Service.find_by!(slug: params[:service_id])
    @town = Town.find_by!(slug: params[:town_id])
    ms = MarketService.find_by!(market_id: @town.market.id, service_id: @service.id)
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
    @services = @market.services
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

  def zip_click_search
    @market = ZipCode.find_by(zip: page_params[:search])&.town&.market
    @service = Service.find_by(slug: page_params[:service])

    if @market
      redirect_to(public_market_service_path @market, @service)
      return
    else 
      redirect_to not_available_path params: request.query_parameters
    end
  end

  def not_available
    @service = Service.find_by!(slug: page_params["service"])
  end

  def zip_search
    zips = ZipCode.search(page_params[:search])
    zips = zips.includes(:town)
    @zips_assoc = zips.map do |record|
      record.attributes.merge(
        'town' => record.town,
        'market' => record.town.market.slug,
        'service' => page_params[:service]
      )
    end
    flash['service'] = page_params[:service]
    render json: @zips_assoc
  end

  def sitemap
    redirect_to 'https://storage.googleapis.com/homeoncall.com/sitemaps/sitemap.xml.gz',format:'xml', status: 301
  end

  private 

  def redirector(service) 
    @town = Town.find_by!(slug: params[:town_id])
    @service = Service.find_by(slug: service)
    redirect_to public_bulk_service_path(@service, @town), status: :moved_permanently
  end

  def page_params
    params.permit(:search,:service)
  end 
  
end
