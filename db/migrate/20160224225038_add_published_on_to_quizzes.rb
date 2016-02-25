class AddPublishedOnToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :published_on, :datetime
  end
end
