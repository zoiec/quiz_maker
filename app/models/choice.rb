class Choice < ActiveRecord::Base
  belongs_to :question
  has_one :quiz, through: :question
  has_many :answers
  has_many :weights
  validates :question, presence: true
  validates :body, presence: true

  def weighted?
    !weights.empty?
  end

end
