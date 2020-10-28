class UsersController < ApplicationController
  def index
    @users = User.all
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

  private

  def user_params
    params.require(:user).permit(:username, :full_name)
  end

  def create_following(user)
    following = Following.new(follower_id: user.id, followed_id: user.id)
    following.save
  end
end
