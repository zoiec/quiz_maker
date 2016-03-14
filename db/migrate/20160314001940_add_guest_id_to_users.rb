class AddGuestIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guest_id, :string
  end
end
