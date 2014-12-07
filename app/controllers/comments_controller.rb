class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.post = post = Post.find(params[:post_id])
    @comment.user = current_user
    #TODO dont redirect, render same on errors
    if @comment.save
      flash[:notice] = "Comment added!"
      redirect_to root_url, notice: "Comment added."
    else
      flash[:error] = "Error commenting. Please try again."
      # render :new
    end
  end
end
