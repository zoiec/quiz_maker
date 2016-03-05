class ChangeUrlToSlug < ActiveRecord::Migration
  def change
    rename_column :quizzes, :url, :slug
  end
end
