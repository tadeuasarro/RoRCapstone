class FollowingsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  def create
    following = Following.new(following_params)

    if following.save
      redirect_to params[:following][:route], notice: "You're following that person!"
    else
      redirect_to params[:following][:route], notice: 'Something went wrong, please try again!'
    end
  end

  def destroy
    following = Following.find(params[:id])
    following.destroy

    redirect_to params[:route], notice: "You've stopped following that person!"
  end

  private

  def following_params
    params.require(:following).permit(:follower_id, :followed_id)
  end
end
