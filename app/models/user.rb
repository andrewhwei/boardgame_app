class User < ActiveRecord::Base
  has_many :boardgames, through: :ownerships
  has_many :ownerships
  has_many :pictures

  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :follower_follows

  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followee_follows
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
