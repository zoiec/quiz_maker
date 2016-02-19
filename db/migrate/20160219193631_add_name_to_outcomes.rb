class AddNameToOutcomes < ActiveRecord::Migration
  def change
    add_column :outcomes, :name, :string
  end
end
