class CategorizedBoardgame < ActiveRecord::Base
  belongs_to :boardgame
  belongs_to :category

  # validates :category_id, :boardgame_id, presence: true
  # validates :category_id, :boardgame_id, numericality: { only_integer: true }
  validates_uniqueness_of :category_id, scope: [:boardgame_id]
end
