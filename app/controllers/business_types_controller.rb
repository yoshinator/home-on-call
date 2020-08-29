class BusinessTypesController < ApplicationController
  before_action :set_business_type, only: [:show, :edit, :update, :destroy]
  before_action :require_signin
  before_action :require_edit_access

  # GET /business_types
  def index
    @business_types = BusinessType.alll(current_user)
  end

  # GET /business_types/1
  def show
  end

  # GET /business_types/new
  def new
    @business_type = BusinessType.new
  end

  # GET /business_types/1/edit
  def edit
  end

  # POST /business_types
  def create
    @business_type = BusinessType.new(business_type_params)

    if @business_type.save
      redirect_to @business_type, notice: 'Business type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /business_types/1
  def update
    if @business_type.update(business_type_params)
      redirect_to @business_type, notice: 'Business type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /business_types/1
  def destroy
    @business_type.destroy
    redirect_to business_types_url, notice: 'Business type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_type
      @business_type = BusinessType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_type_params
      params.require(:business_type).permit(:name, :faq1, :faa1, :faq2, :faa2, :faq3, :faa3, :faq4, :faa4)
    end
end
