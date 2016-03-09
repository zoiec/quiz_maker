class AddFieldsToOutcome < ActiveRecord::Migration
  def change
    add_column :outcomes, :facebook_share, :boolean
    add_column :outcomes, :twitter_share, :boolean
    add_column :outcomes, :email_share, :boolean
    add_attachment :outcomes, :picture
  end
end
