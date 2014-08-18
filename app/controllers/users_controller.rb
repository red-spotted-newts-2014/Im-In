class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @user = User.new
  end

  def create
    @user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password])
    session[:id] = @user.id
    redirect_to events_path
  end

  def login
    p "here"
    p params
    params[:password] = params[:user][:password]
    params[:username] = params[:user][:username]
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      p "logged in!!"
      session[:id] = @user.id
      redirect_to events_path
    else
      p @error = "Invalid email or password"
      redirect_to users_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def attending
    @attending_invitations = current_user.invitations.where(status: "in")
    @attending_events = []
    @attending_invitations.each do |invite|
      @attending_events << Event.find(invite.event_id)
    end
    # @attending_events = current_user.attending_events

    respond_to do |format|
      format.html
      format.json { render :json => { :attending_events => @attending_events }}
    end
  end

  def created
    @created_events = current_user.created_events

    respond_to do |format|
      format.html
      format.json { render :json => { :created_events => @created_events }}
    end
  end

  def followers
    @followers = current_user.followers
    respond_to do |format|
      format.html
      format.json { render :json => { :followers => @followers } }
    end
  end

  def following
    @following = current_user.following_users
    respond_to do |format|
      format.html
      format.json { render :json => { :following => @following } }
    end
  end

  def follow
    @friend = User.find_by(username: params[:user][:username])
    redirect_to user_following_path unless current_user
    # if current_user
    # if current_user == @friend
      # flash[:error] = "You cannot follow yourself."
      # redirect_to user_following_path(current_user)
    # else
      current_user.follow(@friend)
      # flash[:notice] = "You are now following #{@friend.username}."
      redirect_to user_following_path(current_user)
    # end
    # end
  end

  def unfollow
    @friend = User.find_by(username: params[:user][:username])

    redirect_to user_following_path unless current_user
    # if current_user
    current_user.stop_following(@friend)
    flash[:notice] = "You are no longer following #{@friend.username}."
    redirect_to user_following_path(@user)
    # end
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.where(id: params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => { :user => @user } }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :phone_number)
  end

end
