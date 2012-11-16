class AddNoRatingsToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :no_ratings, :integer, :default=>0
    
  end
end
