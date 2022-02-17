class UsersController < ApplicationController
    
  before_action :set_user, only: [:show]


  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "users", template: "users/index.html.erb"
      end
    end
  end

  def new
    @user = User.new
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@user.username}", template: "users/pdfprint.html.erb", orientation: "Portrait", save_only: false
      end
    end
  end

  def create
    @user = User.find_by("username=? AND password=?",params[:user][:username],params[:user][:password]) 
    if !@user.nil?
      session[:user_id] = @user.id 
      cookies.encrypted[:current_user_id] = @user.username  
      flash[:notice] = "Logged in succesfully"
      redirect_to users_path
    else
      flash.now[:notice] = "Try Again"
      render action: "new"
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You have successfully logged out."
    cookies.delete(:current_user_id)
    @_current_user = nil
    redirect_to root_url
  end

  private
     def set_user
      @user = User.find(params[:id])
     end

end
