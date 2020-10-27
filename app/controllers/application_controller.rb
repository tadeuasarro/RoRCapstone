class ApplicationController < ActionController::Base
  private

  def require_login
    redirect_to new_session_path, notice: 'You must login first!' unless session[:user_id]
  end

  def require_logout
    redirect_to root_path if session[:user_id]
  end

  def current_user
    user = User.find(session[:user_id])
    return user if user
  end
end
