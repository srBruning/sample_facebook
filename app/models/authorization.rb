class Authorization < ActiveRecord::Base		
	belongs_to :user
	validates :provider, :uid, :token, :presence => true
end
