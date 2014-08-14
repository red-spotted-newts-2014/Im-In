class UsersController < ApplicationController
  def index
    @user = User.new
  end

  # signup
  def create
    p "******** here"
    @user = User.create(user_params)
    p "******** logged in"
    session[:id] = @user.id
    redirect_to events_path
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect_to events_path
    else
      p "******** poop"
      @error = "Invalid email or password"
      redirect_to users_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def show
    @user = User.find(session[:id])
    @friends = current_user.following_users
    respond_to do |format|
      format.html
      format.json { render :json => { :friends => @friends } }
    end
  end

  def follow
    @user = User.find(session[:id])
    p "****************"
    @friend = User.find_by(username: params[:user][:username])
    p params[:user][:username]
    p @friend

    if current_user
      if current_user == @friend
        flash[:error] = "You cannot follow yourself."
        redirect_to user_path(@user)
      else
        current_user.follow(@friend)
        flash[:notice] = "You are now following #{@friend.username}."
        redirect_to user_path(@user)
      end
    end
  end

  def unfollow
    @user = User.find(session[:id])
    @friend = User.find_by(username: params[:user][:username])

    if current_user
      current_user.stop_following(@friend)
      flash[:notice] = "You are no longer following #{@friend.username}."
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :phone_number)
  end

end
