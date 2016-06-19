class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private
  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end

  private
  def authenticate_user!
    unless current_user && current_user.id.to_s == params[:id].to_s
      # flash[:error] = "Please access one of your own pages"
      redirect_to "/"
    end
  end
  
end
