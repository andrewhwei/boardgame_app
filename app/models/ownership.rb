class Ownership < ActiveRecord::Base
  belongs_to :boardgame
  belongs_to :user

  validates :rating, :num_of_plays, presence: true
end
