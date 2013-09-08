class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :sessions
  has_many :takers, through: :sessions, source: :taker, foreign_key: :user_id
  has_many :questions

  validates :title, presence: true 
  validates :creator_id, presence: true 
end
