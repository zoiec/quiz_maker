class Weight < ActiveRecord::Base
  belongs_to :outcome
  belongs_to :choice
  validates :outcome, presence: true
  validates :choice, presence: true
  validates :strength, numericality: { only_integer: true, greater_than: 0 }


end
