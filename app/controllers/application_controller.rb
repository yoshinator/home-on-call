class ApplicationController < ActionController::Base

  private

  def require_super
    unless current_admin.super 
      send_off
    end
  end

  def require_client_access 
    unless current_admin.client_access 
      send_off
    end
  end

  def require_edit_access 
    unless current_admin.edit_access 
      send_off
    end
  end

  def send_off 
    redirect_to admin_session_path(current_admin), alert: "Not enough privilige to view this page"
  end 

end
