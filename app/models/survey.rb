class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :sessions
  has_many :takers, through: :sessions, source: :taker, foreign_key: :user_id
  has_many :questions
  has_many :choices, through: :questions
  has_many :responses, through: :choices

  validates :title, presence: true 
  validates :creator_id, presence: true
  mount_uploader :photo_url, Uploader
end
