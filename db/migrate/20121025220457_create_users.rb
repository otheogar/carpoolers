class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :provider
      t.string :gender
      t.datetime :date_of_birth
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
