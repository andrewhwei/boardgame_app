class Picture < ActiveRecord::Base
  belongs_to :user

  validates :link, :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }
end
