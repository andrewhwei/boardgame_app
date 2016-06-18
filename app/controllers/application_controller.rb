class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end
  
  def authenticate_user!
    unless current_user
      redirect_to "/"
    end
  end
  
end
