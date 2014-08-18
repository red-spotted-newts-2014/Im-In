class Invitation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  def find_username(user_id)
    User.find(user_id).username
  end

end
