class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices 

  validates :title, presence: true 
  validates :creator, presence: true 
end
