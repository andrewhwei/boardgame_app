class Boardgame < ActiveRecord::Base
  has_many :users, through: :ownerships
  has_many :ownerships

  has_many :categories, -> { order 'mechanism ASC' }, through: :categorizedBoardgames
  has_many :categorizedBoardgames

  validates :name, :developer, presence: true
  validates :name, uniqueness: true

  validate :has_at_least_one_category

  def has_at_least_one_category
    if categorizedBoardgames.empty?
      errors.add(:boardgame, "must have at least one category")
    end
  end
end
