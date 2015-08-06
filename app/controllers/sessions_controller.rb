class SessionsController < ApplicationController
  def new
  end
  
  def create  
    user = User.authenticate(params[:session][:email], params[:session][:password]) 
    if user.nil?
      flash.now[:error] = "Invalid Username/Password combination"
      render 'new'
    else
      sign_in user
      redirect_to_prev user
    end
  end
  
  def destroy
     signed_out
     redirect_to root_path
  end
end
