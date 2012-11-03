class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :gender, :name, :oauth_expires_at, :oauth_token, :provider, :uid
  has_one :user_profile,:foreign_key => :user_uid,  :primary_key => :uid, :inverse_of => :user, :dependent => :destroy
   self.primary_key="uid"

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.create_user_profile(:name => auth.info.name, :email => auth.info.email, :gender => auth.extra.raw_info.gender)
      user.save!
    end
  end

end
