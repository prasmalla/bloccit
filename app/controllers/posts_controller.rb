class PostsController < ApplicationController
  before_filter :find_topic

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    #RAILS4 @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post = current_user.posts.build(params[:post])
    @post.topic = @topic
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def find_topic
    @topic  = Topic.find(params[:topic_id])
  end  
end
