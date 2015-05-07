class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to user_posts_path(current_user)
  end
end
