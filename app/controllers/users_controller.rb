class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
    @comments = @user.comments
  end 
end
