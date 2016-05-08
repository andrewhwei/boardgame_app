class CategorizedBoardgame < ActiveRecord::Base
  belongs_to :boardgame
  belongs_to :category
end
