class UserProfile < ActiveRecord::Base

  attr_accessible :age, :description, :email, :gender, :name, :picture_url, :user_uid
  validates :user_uid, :email, :uniqueness => true

  belongs_to :user, :foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user_profile
  belongs_to :user_login, :foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user_profile
 # has_many :trip,

end
