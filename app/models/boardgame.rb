class Boardgame < ActiveRecord::Base
  has_many :users, through: :ownerships
  has_many :ownerships

  has_many :categories, through: :categorizedBoardgames
  has_many :categorizedBoardgames

end
