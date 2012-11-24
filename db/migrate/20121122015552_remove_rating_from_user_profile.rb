class RemoveRatingFromUserProfile < ActiveRecord::Migration
  def up
    remove_column :user_profiles, :rating
  end

  def down
    add_column :user_profiles, :rating, :integer
  end
end
