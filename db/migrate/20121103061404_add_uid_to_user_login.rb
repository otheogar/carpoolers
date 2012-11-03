class AddUidToUserLogin < ActiveRecord::Migration
  def change
    add_column :user_logins, :uid, :string

    add_index :user_logins, :uid, :unique => true
  end
end
