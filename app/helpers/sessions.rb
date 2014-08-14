module SessionsHelper
  def current_user
    @user ||= User.find(session[:id]) if session[:user_id]
  end
end
