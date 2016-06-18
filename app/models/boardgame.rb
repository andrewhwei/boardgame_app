class Boardgame < ActiveRecord::Base
  has_many :users, through: :ownerships
  has_many :ownerships

  has_many :categories, -> { order 'mechanism ASC' }, through: :categorizedBoardgames
  has_many :categorizedBoardgames

end
