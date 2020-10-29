class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
    @users = User.where('username LIKE ?', "%#{params[:user][:username]}%") if params[:user]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      create_following(@user)
      session[:user_id] = @user.id
      redirect_to posts_path, notice: 'You have signed up, welcome!'
    else
      redirect_to new_user_path, notice: 'Something went wrong, please try again!'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name)
  end

  def create_following(user)
    following = Following.new(follower_id: user.id, followed_id: user.id)
    following.save
  end
end
