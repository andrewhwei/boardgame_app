class Picture < ActiveRecord::Base
  belongs_to :user

  validates :link, :user_id, presence: true
end
