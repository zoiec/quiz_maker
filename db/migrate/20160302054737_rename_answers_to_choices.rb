class RenameAnswersToChoices < ActiveRecord::Migration
  def change
    rename_table :answers, :choices
  end
end
