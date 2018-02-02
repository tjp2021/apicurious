class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
=======

  def current_user
    @current_user ||= User.find(session[:user_id])
>>>>>>> master
  end
end
