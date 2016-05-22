class User < ActiveRecord::Base
  has_many :boardgames, through: :ownerships
  has_many :ownerships
  has_many :pictures
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def initialize
    
  end       

end
