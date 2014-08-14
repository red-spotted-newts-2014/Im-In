class User < ActiveRecord::Base
  has_secure_password
  acts_as_follower
  acts_as_followable

  has_many :invitations
  has_many :events, through: :invitations
  has_many :created_events, class_name: :Event, foreign_key: :user_id
end
