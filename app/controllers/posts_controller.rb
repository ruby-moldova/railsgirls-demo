class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def vote_up
    post = Post.find(params[:id])
    post.vote_up(current_user)
    redirect_to post
  end

  def vote_down
    post = Post.find(params[:id])
    post.vote_down(current_user)
    redirect_to post
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to user_posts_path(current_user)
  end
end
