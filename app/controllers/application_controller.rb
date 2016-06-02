class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def restrict_access
    authenticate_or_request_with_http_token do |api_key, options|
      User.find_by(api_key: api_key, email: request.headers['X-User-Email'])
    end
  end

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
    end
  end
  
end
