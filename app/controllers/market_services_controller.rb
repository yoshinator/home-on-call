class MarketServicesController < ApplicationController
  before_action :require_signin
  before_action :set_market_service, only: [:show, :edit, :update, :destroy]

  # GET /market_services
  def index
    @market_services = MarketService.all
  end

  # GET /market_services/1
  def show
  end

  # GET /market_services/new
  def new
    @market_service = MarketService.new
  end

  # GET /market_services/1/edit
  def edit
  end

  # POST /market_services
  def create
    @market_service = MarketService.find_by(market_service_params)
    if @market_service
      redirect_to market_service_edit_path(@market_service.service), notice: "Service is already in market"
      return
    else
      @market_service = MarketService.new(market_service_params)
    end
    if @market_service.save
      redirect_to @market_service, notice: 'Market service was successfully created.'
      return
    else
      render :new
    end
  end

  # PATCH/PUT /market_services/1
  def update
    if @market_service.update(market_service_params)
      redirect_to @market_service, notice: 'Market service was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /market_services/1
  def destroy
    @market_service.destroy
    redirect_to market_services_url, notice: 'Market service was successfully destroyed.'
  end

  # DELETE /market_services/market_id/service_id
  def delete_market_service
    service = Service.find(params[:service_id])
    market_service = MarketService.find_by!(service_id: params[:service_id], market_id: params[:market_id])
    market_service.destroy()
    redirect_to market_service_edit_path(service), notice: "Market Service was succesfully deleted" 
  end

  def service
    @service = Service.find_by!(slug: params[:service_id])
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_service
      @market_service = MarketService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def market_service_params
      params.require(:market_service).permit(:market_id, :service_id)
    end
end
