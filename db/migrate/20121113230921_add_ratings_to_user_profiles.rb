class AddRatingsToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :ratings, :integer, :default=>0
    
  end
end
