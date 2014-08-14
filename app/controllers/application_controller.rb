class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  protect_from_forgery with: :exception

  def current_user
    # @user ||= User.find(session[:id]) if session[:id]
    @user ||= User.find(1)
  end
end
