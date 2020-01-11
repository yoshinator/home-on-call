class ApplicationController < ActionController::Base

  private

  # TODO: If we ge client sessions going add an || Client.find(session[:client_admin]) if session[:client_id] 
  def current_user
    @current_user || Admin.find(session[:admin_id]) if session[:admin_id] 
  end

  def require_signin
    unless current_user
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end

  def require_super
    unless current_user.super 
      send_off
    end
  end

  def require_client_access 
    unless current_user.client_access 
      send_off
    end
  end

  def require_edit_access 
    unless current_user.edit_access 
      send_off
    end
  end

  def send_off 
    redirect_to admin_path(current_user), alert: "Not enough privilige to view this page"
  end 

  helper_method :current_user
end
