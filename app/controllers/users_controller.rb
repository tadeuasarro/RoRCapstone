class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
    @users = User.where('full_name LIKE ?', "%#{params[:user][:full_name]}%") if params[:user]
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.photo = './assets/images/user.png'
    @user.cover_image = './assets/images/user.png'

    if @user.save
      create_following(@user)
      session[:user_id] = @user.id
      redirect_to posts_path, notice: @user.photo.to_s
    else
      redirect_to new_user_path, notice: 'Something went wrong, please try again!'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:photo]
      @user.photo = params[:user][:photo]
    elsif params[:user][:cover_image]
      @user.cover_image = params[:user][:cover_image]
    end

    if @user.save
      redirect_to edit_user_path(params[:id]), notice: 'The picture has been uploaded successfully!'
    else
      redirect_to edit_user_path(params[:id]), notice: 'Something went wrong, please try again!'
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
