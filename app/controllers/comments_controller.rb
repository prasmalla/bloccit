class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment added!"
      redirect_to [@post.topic, @post], notice: "Comment added."
    else
      flash[:error] = "Error commenting. Please try again."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
