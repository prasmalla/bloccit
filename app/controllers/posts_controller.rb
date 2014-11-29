class PostsController < ApplicationController
  def index
    @posts = Post.all
    #authorize @posts
    #Pundit is unable to find class for a CollectionProxy(Array)
    #https://github.com/elabs/pundit/issues/213
    @posts.each do |post|
      authorize post
    end  
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    #RAILS4 @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post = current_user.posts.build(params[:post])
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
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
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end
