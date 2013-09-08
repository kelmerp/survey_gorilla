class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  validates :choice, presence: true 
  validates :question_id, presence: true 
end
