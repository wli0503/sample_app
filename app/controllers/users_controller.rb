class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:edit, :update, :index]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :is_admin, :only => :destroy
  
  def new
    @user = User.new
    @title = 'Sign up'
  end
  
  def create
    @user = User.new(params[:user])
    if(@user.save)
      sign_in @user
      flash[:success] = "Welcome to the sample app!"
      redirect_to @user
    else
      render 'new'
      @title = "Sign up"
    end
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.username
  end
  
  def edit
    #@user = User.find(params[:id])
    @title = "Edit Profile"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit User"
      render 'edit'
    end
  end
  
  def index
    @users = User.paginate(:page=>params[:page])
    @title = "User information"
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end
  
  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end
  
  def is_admin
    redirect_to root_path unless current_user.admin?
  end
end
