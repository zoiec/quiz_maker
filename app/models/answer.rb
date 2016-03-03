class Answer < ActiveRecord::Base
  belongs_to :choice
  has_one :question, through: :choice
  belongs_to :user
end
