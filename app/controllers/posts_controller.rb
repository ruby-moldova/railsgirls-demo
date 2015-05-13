class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:rate, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def rate
    post = Post.find(params[:id])
    rating = post.rating_by(current_user)
    rating.value = params[:rating][:value]
    rating.save
    redirect_to post
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to user_posts_path(current_user)
  end
end
