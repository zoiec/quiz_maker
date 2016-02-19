class Quiz < ActiveRecord::Base
  has_many :outcomes
  has_many :questions
  validates :title, presence: true
  validates :url, presence: true



end
