class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :gender, :name, :oauth_expires_at, :oauth_token, :provider, :uid
  self.primary_key = "uid"

      def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.email = auth.info.email
      user.gender = auth.extra.raw_info.gender
      user.save!
    end
  end

end
