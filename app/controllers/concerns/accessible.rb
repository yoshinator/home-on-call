module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      # redirect to home_path
      redirect_to edit_admin_registration_path and return
      # redirect_to(rails_admin.dashboard_path) and return
    elsif current_client
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      # render json: { message: "If you see this, you're in!" } and return
      redirect_to edit_client_api_path and return
    end
  end
end