class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]
  before_action :require_signin
  before_action :require_edit_access

  # GET /markets
  def index
    @markets = Market.all
  end

  # GET /markets/1
  def show
  end

  # GET /markets/new
  def new
    @market = Market.new
  end

  # GET /markets/1/edit
  def edit
  end

  # POST /markets
  def create
    @market = Market.new(market_params)

    if @market.save
      redirect_to @market, notice: 'Market was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /markets/1
  def update
    if @market.update(market_params)
      redirect_to @market, notice: 'Market was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /markets/1
  def destroy
    @market.destroy
    redirect_to markets_url, notice: 'Market was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find_by!(slug: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def market_params
      params.require(:market).permit(:name)
    end
end
