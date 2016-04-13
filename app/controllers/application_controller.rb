class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  
  #note: mothods are available to all controllers but not available to views by default, so they must be told that they are helper methods. 
  helper_method :current_user, :logged_in? 
  
  
  def current_user
    #return @current_user if it exists 'if not' get it from the database
    # "||=" if not then ...
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  
  def logged_in? 
    # make it boolean = !!
    !!current_user
  end
  
  

  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in the perform that action"
      redirect_to root_path
    end
  end
  
  
  
  
  
  
end
