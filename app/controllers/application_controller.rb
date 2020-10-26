class ApplicationController < ActionController::Base

  private

  def require_login
    unless session[:user_id]
      redirect_to new_session_path, notice: 'You must login first!'
    end
  end

  def require_logout
    redirect_to root_path if session[:user_id]
  end

end
