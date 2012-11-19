class Message < ActiveRecord::Base
  attr_accessible :body, :read_msg, :sub, :owner_id
   belongs_to :user_profiles, :foreign_key => :owner_id, :primary_key => :user_uid, :inverse_of => :message
end
