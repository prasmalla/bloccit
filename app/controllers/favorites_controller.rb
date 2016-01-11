class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    
    authorize favorite
    if favorite.save
      flash[:notice] = "Added to Favorites!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "Error favoriting. Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])  
    favorite = current_user.favorites.find(params[:id])

    authorize favorite
    if favorite.destroy
      flash[:notice] = "Removed from Favorites!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "Error unfavoriting. Please try again."
      redirect_to [post.topic, post]
    end
  end    
end
