class SessionsController < ApplicationController
  before_action :require_logout, only: %i[new create]
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in!'
    else
      redirect_to new_session_path, notice: 'Invalid user!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged out!'
  end
end
