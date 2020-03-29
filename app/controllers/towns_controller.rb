class TownsController < ApplicationController
  before_action :set_town, only: [:show, :edit, :update, :destroy]
  before_action :require_signin
  before_action :require_edit_access

  # GET /towns
  # Shows markets instead of towns so that towns are viewed throgh the index only. 
  def index
    @markets = Market.all
  end

  # GET /towns/1
  def show
  end

  # GET /towns/new
  def new
    @town = Town.new
  end

  # GET /towns/1/edit
  # def edit
  # end

  # def bulk_new 
  #   @town = Town.new
  # end 

  def bulk_create
    Town.bulk_create(town_params)
    redirect_to towns_path
  end 
  # POST /towns
  def create
    @town = Town.new(town_params)

    if @town.save
      redirect_to @town, notice: 'Town was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /towns/1
  def update
    if @town.update(town_params)
      redirect_to @town, notice: 'Town was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /towns/1
  def destroy
    @town.destroy
    redirect_to towns_url, notice: 'Town was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_town
      @town = Town.find_by!(slug: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def town_params
      params.require(:town).permit(:name, :county, :state, :market_id, :slug)
    end
end
