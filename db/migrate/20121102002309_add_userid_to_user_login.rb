class AddUseridToUserLogin < ActiveRecord::Migration
  def change
    add_column :user_logins, :userid, :string
  end
end
