class AddIntroContentToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :intro_content, :text
  end
end
