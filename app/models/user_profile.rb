class UserProfile < ActiveRecord::Base

  attr_accessible :age, :description, :email, :gender, :name, :picture_url, :user_uid, :home_string, :home_latitude,:home_longitude,:ratings,:no_ratings
  validates :user_uid, :email, :uniqueness => true

  belongs_to :user, :foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user_profile
  belongs_to :user_login, :foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user_profile
  has_many :trip, :foreign_key => :owner_id,  :primary_key => :user_uid, :inverse_of => :user_profile

end
