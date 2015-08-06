module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def signed_out
    cookies.delete(:remember_token)
    current_user = nil
  end
  
  def deny_access
    save_prev_location
    redirect_to signin_path, :notice => "You need to sign in before changing profile!"
  end
  
  def redirect_to_prev(default)
    next_location = session[:return_to] || default  
    redirect_to next_location
  end
  
  def current_user?(user)
    user == current_user
  end
  
  private
  
  def user_from_remember_token
    User.authenticate_with_salt(*remember_token)
  end
  
  def remember_token
    cookies.signed[:remember_token] || [nil, nil]
  end
  
  def save_prev_location
    session[:return_to] = request.fullpath
  end
    
  def clean_saved_location
    session[:return_to] = nil
  end
  
end
