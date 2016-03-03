class Choice< ActiveRecord::Base
  belongs_to :question
  has_many :answers
  validates :question, presence: true
  validates :body, presence: true

end
