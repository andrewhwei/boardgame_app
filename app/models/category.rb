class Category < ActiveRecord::Base
  has_many :boardgames, through: :categorizedBoardgames
  has_many :categorizedBoardgames
end
