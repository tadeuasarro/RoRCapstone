class UsersController < ApplicationController
  before_action :require_login, except: %i[new delete create]
  before_action :require_logout, only: %i[new create]
  def index
    @user = User.new
    @users = User.all
    @users = User.where('full_name LIKE ?', "%#{params[:user][:full_name]}%") if params[:user]
  end

  def show
    @user = User.find(params[:id])
    @posts = gather_posts
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
      redirect_to posts_path, notice: 'Account created successfully, welcome!'
    else
      errors = @user.errors.first
      redirect_to new_user_path, notice: "#{errors.first.capitalize} #{errors.last}."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    begin
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
    rescue StandardError
      redirect_to edit_user_path(params[:id]), notice: 'Please, select a valid file!'
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

  def gather_posts
    @user.posts.includes([:user]).order('created_at DESC').to_a
  end
end
