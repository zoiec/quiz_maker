class ChangeAnswerIdToChoiceId < ActiveRecord::Migration
  def change
    rename_column :weights, :answer_id, :choice_id
  end
end
