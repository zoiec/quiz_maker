class RecreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |table|
      table.integer :user_id
      table.integer :choice_id

      table.timestamps
    end
  end
end
