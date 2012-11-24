class AddRatingToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :rating, :integer, :default=>0
  end
end
