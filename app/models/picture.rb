class Picture < ActiveRecord::Base
  belongs_to :user

  validates :link, presence: true
end
