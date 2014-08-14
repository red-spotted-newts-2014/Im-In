class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invitations
  has_many :events, through: :invitations
  has_many :created_events, class_name: :Event, foreign_key: :user_id
end
