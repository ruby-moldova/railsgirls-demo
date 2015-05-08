class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    c = Comment.new(comment_params)
    c.post = Post.find(params[:post_id])
    c.user = current_user
    c.save
    redirect_to c.post
  end

  def destroy
    Comment.destroy(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
