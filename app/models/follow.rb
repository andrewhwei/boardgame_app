class Follow < ActiveRecord::Base
  belongs_to :follower, foreign_key: "follower_id", class_name: "User"
  belongs_to :followee, foreign_key: "followee_id", class_name: "User"

  validates :follower_id, :followee_id, presence: true
  validates :follower_id, :followee_id, numericality: { only_integer: true }

  validates_uniqueness_of :follower_id, :scope => :followee_id, :message => "You are already following this user"
end
