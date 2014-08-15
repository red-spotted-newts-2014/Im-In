class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User",
                       foreign_key: :user_id
  has_many :invitations
  has_many :invitees, through: :invitations, source: :user

  before_save :add_username

  def add_username
    username = User.find(user_id).username
  end

end
