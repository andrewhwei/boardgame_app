class Ownership < ActiveRecord::Base
  belongs_to :boardgame
  belongs_to :user

  validates :user_id, :boardgame_id, :rating, :num_of_plays, presence: true
  validates :rating, :num_of_plays, :user_id, :boardgame_id, numericality: { only_integer: true }
  validates_uniqueness_of :boardgame_id, scope: [:user_id]
  validates_inclusion_of :rating, :in => 1..10, :message => "must be in between 1 and 10"
end