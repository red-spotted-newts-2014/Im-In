module SessionsHelper
  def current_user
    @user ||= User.find(session[:id]) if session[:id]
    # @user ||= User.find(1)
  end
end
