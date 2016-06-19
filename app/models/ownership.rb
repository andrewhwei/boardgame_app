class Ownership < ActiveRecord::Base
  belongs_to :boardgame
  belongs_to :user

  validates :user_id, :boardgame_id, :rating, :num_of_plays, presence: true
  validates :rating, :num_of_plays, numericality: { only_integer: true }
  validates_uniqueness_of :boardgame_id, scope: [:user_id]
end
