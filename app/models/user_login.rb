class UserLogin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid
  # attr_accessible :title, :body

  has_one :user_profile, :foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user_login, :dependent => :destroy


  def self.at_signup(email)

    this_user = where(:email => email).first

    this_user.create_user_profile(:user_uid => email, :email => email)

  end

end
