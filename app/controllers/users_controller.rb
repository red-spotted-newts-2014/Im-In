class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def show
    @friends = current_user.following_users
    respond_to do |format|
      format.html
      format.json { render :json => { :friends => @friends } }
    end
  end

  # def edit
  #   @user = User.find(params[:id])
  # end

  def follow
    @friend = User.find_by(username: params[:username])

    if current_user
      if current_user == @friend
        flash[:error] = "You cannot follow yourself."
      else
        current_user.follow(@friend)
        flash[:notice] = "You are now following #{@friend.username}."
      end
    end
  end

  def unfollow
    @friend = User.find_by(username: params[:username])

    if current_user
      current_user.stop_following(@friend)
      flash[:notice] = "You are no longer following #{@friend.username}."
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :phone_number)
  end

end
