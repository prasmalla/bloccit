class UsersController < ApplicationController
  before_filter :authenticate_user!

  def update
    if current_user.update_attributes(params[:user])
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end 
end
