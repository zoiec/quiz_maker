class Choice< ActiveRecord::Base
  belongs_to :question
  validates :question, presence: true
  validates :body, presence: true

end
