class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :user_uid
      t.string :name
      t.string :email
      t.string :gender
      t.integer :age
      t.string :picture_url
      t.text :description

      t.timestamps
    end

    add_index :user_profiles, :user_uid, :unique => true
  end


end
