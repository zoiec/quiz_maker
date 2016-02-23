class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :outcome_id
      t.integer :answer_id
      t.integer :strength

      t.timestamps
    end
  end
end
