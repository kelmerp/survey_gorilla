class Response < ActiveRecord::Base
  belongs_to :taker, class_name: "User"
  belongs_to :choice

  validates :choice, presence: true
  validates :taker, presence: true 
end
