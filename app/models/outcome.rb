class Outcome < ActiveRecord::Base
  belongs_to :quiz
  has_attached_file :picture
  validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates :name, presence: true
  validates :quiz_id, presence: true
end
