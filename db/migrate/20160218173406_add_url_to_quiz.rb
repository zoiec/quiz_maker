class AddUrlToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :url, :string
  end
end
