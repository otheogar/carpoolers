class UserProfile < ActiveRecord::Base

  attr_accessible :age, :description, :email, :gender, :name, :picture_url, :user_uid, :home_string, :home_latitude,:home_longitude,:rating,:no_rating
  validates :user_uid, :email, :uniqueness => true
 validates :age, allow_blank: true, format: {with: %r{\A[0-9]+\z}i, message: 'has to be expressed as a number'}
  validates :picture_url, allow_blank: true, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :name, allow_blank: true, format: {
      with: %r{\A[a-zA-Z\s]+\z}i,
      message: 'must contain only letters and spaces.'
  }

  validates :gender, allow_blank: true, format: {
      with: %r{\A(Male)|(Female)\z}i,
      message: 'must be Male or Female.'
  }
  belongs_to :user, :foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user_profile
  belongs_to :user_login, :foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user_profile
  has_many :trip, :foreign_key => :owner_id,  :primary_key => :user_uid, :inverse_of => :user_profile
  has_many :message, :foreign_key => :owner_id,  :primary_key => :user_uid, :inverse_of => :user_profile
  has_many :trip_connect, :foreign_key => :other_id,  :primary_key => :user_uid, :inverse_of => :user_profile
end
