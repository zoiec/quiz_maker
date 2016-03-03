class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :outcome_id
      t.integer :user_id

      t.timestamps
    end
  end
end
