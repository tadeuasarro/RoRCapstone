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
    result = Post.where(user: current_user.followeds).to_a
    result.sort! { |x, y| y.created_at <=> x.created_at }
  end

  def gather_suggestions
    (User.all {} - current_user.followeds {})
  end
end
