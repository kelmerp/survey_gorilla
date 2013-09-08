class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices 

  validates :question, presence: true 
  validates :survey, presence: true


  def choice_counts
    choices = self.choices
    full_hash = {}
    c = choices.map { |c| { c.choice => c.responses.count } }
    c.each do |h|
      full_hash = full_hash.merge(h)
    end
    full_hash
  end
end
