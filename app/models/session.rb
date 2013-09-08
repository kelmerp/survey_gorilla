class Session < ActiveRecord::Base
  belongs_to :survey 
  belongs_to :taker, class_name: "User"

  validates :survey, presence: true 
  validates :taker, presence: true  
end
