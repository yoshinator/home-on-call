class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :require_signin
  before_action :require_super, except: [:show]

  # GET /admins
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to @admin, notice: 'Admin was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      redirect_to @admin, notice: 'Admin was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
    if @admin.id == session[:admin_id]
      session[:admin_id] = nil
    end
    redirect_to admins_url, notice: 'Admin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:fname, :lname, :email, :password, :password_confirmation, :super, :client_access, :edit_acces)
    end
end
