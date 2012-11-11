class User < ActiveRecord::Base
  attr_accessible :oauth_expires_at, :oauth_token, :provider, :uid
  validates :uid, :uniqueness => true

  has_one :user_profile,:foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user, :dependent => :destroy
   self.primary_key="uid"

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      if user.user_profile.nil?
        user.create_user_profile(:name => auth.info.name, :email => auth.info.email, :gender => auth.extra.raw_info.gender)
      else
        user_profile = user.user_profile
        user_profile.name = auth.info.name
        user_profile.email = auth.info.email
        user_profile.gender = auth.extra.raw_info.gender
        user_profile.save!
      end
      user.save!
    end
  end

end
