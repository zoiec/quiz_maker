class Outcome < ActiveRecord::Base
  belongs_to :quiz
  validates :name, presence: true
  validates :quiz_id, presence: true
end
