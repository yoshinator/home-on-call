class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy]
  before_action :require_edit_access, only: [:edit, :update, :destroy]

  # GET /leads
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  def create
    @lead = Lead.new()
    @lead.f_name = lead_params[:f_name]
    @lead.client_id = lead_params[:client_id]
    @lead.email = lead_params[:email]
    @lead.street1 = lead_params[:street1]
    @lead.city = lead_params[:city]
    @lead.phone = lead_params[:phone]
    @lead.content = "Service type: #{lead_params[:service_type]}, \n Time Line: #{lead_params[:time_line]}, \nIs this for a business: #{lead_params[:business]} \n #{lead_params[:entry]}"

    if @lead.save
      LeadMailer.with(lead: @lead).new_lead_email.deliver_now
      TextingService.call(@lead.client.phone, @lead)
      redirect_to root_path, notice: 'Thank you for contacting us. We will be in touch with you shortly'
    else
      render :new
    end
  end

  # PATCH/PUT /leads/1
  def update
    if @lead.update(lead_params)
      redirect_to @lead, notice: 'Lead was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /leads/1
  def destroy
    @lead.destroy
    redirect_to leads_url, notice: 'Lead was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through. 
    # :service type and :time_line are not in the schema add them to the content.
    def lead_params
      params.require(:lead).permit(:client_id, :f_name, :l_name, :phone, :email, :street1, :street2, :city, :state, :business, :content, :size, :service_type, :time_line, :zip, :entry)
    end
end
