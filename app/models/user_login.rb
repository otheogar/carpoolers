class UserLogin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid
  # attr_accessible :title, :body

  validates :uid, :email, :uniqueness => true
  has_one :user_profile, :foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user_login, :dependent => :destroy


  def self.at_signup(email)

    this_user = where(:email => email).first
    this_user.uid = email;
    this_user.save!





	logger.info "before create profile"
    UserProfile.where(:user_uid => email).first_or_create!(:user_uid => email,:email=>email)



  end

end
