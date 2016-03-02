class Quiz < ActiveRecord::Base
  has_many :outcomes
  has_many :questions
  validates :title, presence: true
  validates :url, presence: true

  scope :published, -> { where(published: true) }

  def publish!
    self.update_attributes(published: true, published_at: Time.now)
  end

  def first_question
    questions.first
  end

end
