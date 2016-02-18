class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :outcomes do |t|
      t.string :body
      t.integer :quiz_id
      t.timestamps
    end
  end
end
