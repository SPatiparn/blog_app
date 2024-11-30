class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user, :authenticate_user!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    if !current_user && !request.path.start_with?('/login')
      redirect_to login_path
    end
  end
end
