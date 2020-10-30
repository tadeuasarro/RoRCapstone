class PostsController < ApplicationController
  before_action :require_login, only: [:index]

  def index
    @post = Post.new
    @posts = gather_posts
    @users = gather_suggestions
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post created!'
    else
      redirect_to root_path, notice: 'Something went wrong, please try again!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

  def gather_posts
    Post.where(user: current_user.followeds).order('created_at DESC').to_a
  end

  def gather_suggestions
    (User.all.order('created_at DESC') {} - current_user.followeds {})
  end
end
