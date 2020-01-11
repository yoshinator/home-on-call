class PagesController < ApplicationController

  # Client will return first client in db if no client found. 
  # Use first client for default emails. 
  def show
    @service = Service.find_by!(slug: params[:service_id])
    @town = Town.find_by!(slug: params[:town_id])
    @client = Page.get_client(@town, @service)
  end 

  def service
    @service = Service.find_by!(slug: params[:service_id])
    @market = Market.find_by!(slug: params[:market_id])
  end

  def town 
    @town = Town.find_by!(slug: params[:town_id])
    @services = Service.all
  end

end