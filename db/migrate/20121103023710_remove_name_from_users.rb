class RemoveNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :name
    remove_column :users, :email
    remove_column :users, :gender
    remove_column :users, :date_of_birth
  end

  def down
    add_column :users, :date_of_birth, :string
    add_column :users, :gender, :string
    add_column :users, :email, :string
    add_column :users, :name, :string
  end
end
