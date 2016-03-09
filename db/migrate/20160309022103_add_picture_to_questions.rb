class AddPictureToQuestions < ActiveRecord::Migration
  def change
    add_attachment :questions, :picture
  end
end
