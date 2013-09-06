class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :sessions
  has_many :takers, through: :sessions, source: :user, foreign_key: :taker_id
  has_many :questions
end
