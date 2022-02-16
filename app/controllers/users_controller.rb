class UsersController < ApplicationController
  def new
  end
  def new
    @user = User.new
  end

  def create
    @user = User.find_by("username=? AND password=?",params[:user][:username],params[:user][:password]) 
    session[:user_id] = @user.id 
    flash[:notice] = "Logged in succesfully"
    redirect_to root_path
  end

  def destroy
    
    session.delete(:user_id)
    flash[:notice] = "You have successfully logged out."
    @_current_user = nil
    redirect_to root_url
  end

end
