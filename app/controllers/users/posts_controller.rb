class Users::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create(post_params)
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
