class ChangePublishedOnToPublishedAt < ActiveRecord::Migration
  def change
    rename_column :quizzes, :published_on, :published_at
  end
end
