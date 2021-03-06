class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by_email(params[:session][:email])
    
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Logged in."
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "Username or Password is incorrect"
      redirect_to login_path
    end 
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully Logged out."
    redirect_to root_path
  end

end
