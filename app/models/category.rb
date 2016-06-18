class Category < ActiveRecord::Base
  has_many :boardgames, through: :categorizedBoardgames
  has_many :categorizedBoardgames

  validates :mechanism, presence: true
  validates :mechanism, uniqueness: true
end
